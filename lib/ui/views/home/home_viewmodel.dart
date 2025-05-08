part of 'home_view.dart';

class Bookmark {
  final String link;
  final String createdAt;

  Bookmark({
    required this.link,
    String? createdAt,
  }) : createdAt = createdAt ?? DateTime.now().toIso8601String();
}

class BookmarkMetadata {
  final String title;
  final String description;
  final String? imageUrl;

  BookmarkMetadata({
    required this.title,
    required this.description,
    this.imageUrl,
  });
}

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewModel");
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();
  final _pref = locator<LocalStorageService>();
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];

  String name = "";
  String email = "";
  String avatar = "";
  String uid = "";
  final NavigationService navigationService = locator<NavigationService>();
  static final Map<String, BookmarkMetadata> ogDataCache = {};

  final List<Bookmark> _bookmarks = [
    Bookmark(
        link:
            "https://timesofindia.indiatimes.com/travel/destinations/places-to-visit-in-jammu-the-key-attractions-of-this-heavenly-land/articleshow/59557249.cms"),
    Bookmark(link: "https://www.github.com"),
    Bookmark(link: "https://www.stackoverflow.com"),
    Bookmark(link: "https://www.reddit.com"),
    Bookmark(
        link:
            "https://medium.com/@vpznc/free-mobbin-and-appshots-alternatives-for-ui-references-990d10f9e01f"),
    Bookmark(link: "https://www.youtube.com/watch?v=r6lFBUytgDM"),
    Bookmark(link: "https://pin.it/1qJYRRc01"),
  ];
  List<Bookmark> get getBookmarks => _bookmarks;

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void init() async {
    setBusy(true);
    log.d("HomeViewModel initialized");
    name = _pref.read('name') ?? '';
    email = _pref.read('email') ?? '';
    avatar = _pref.read('avatar') ?? '';
    uid = _pref.read('uid') ?? '';
    handleSharingIntent();
    for (var bookmark in _bookmarks) {
      await fetchOgData(bookmark);
    }
    setBusy(false);
  }

  @override
  void dispose() {
    _intentSub.cancel();
    super.dispose();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _searchController.clear();
    _isSearching = false;
    notifyListeners();
  }

  // void handleFileAction() {
  //   log.i("File action triggered");
  //   // Add your logic for handling files
  // }

  // void handleLinkAction() {
  //   log.i("Link action triggered");
  //   // Add your logic for handling links
  // }

  // void handleNoteAction() {
  //   log.i("Note action triggered");
  //   // Add your logic for handling notes
  // }

  // void handlePdfAction() {
  //   log.i("PDF action triggered");
  //   // Add your logic for handling PDFs
  // }

  Future showSettingBottomSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.settings,
      ignoreSafeArea: true,
      enableDrag: true,
      barrierDismissible: true,
      isScrollControlled: true,
    );
  }

  Future<void> showSearchBottomSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.search,
      ignoreSafeArea: true,
      enableDrag: true,
      barrierDismissible: true,
      isScrollControlled: true,
    );
  }

  List<Bookmark> get bookmarks {
    if (searchQuery.isEmpty) {
      return _bookmarks;
    }

    return _bookmarks
        .where((bookmark) =>
            (bookmark.link.toLowerCase()).contains(searchQuery.toLowerCase()))
        .toList();
  }

  void onSearchIconTap() {
    _isSearching = !_isSearching;
    notifyListeners();
  }

  void navigateToSearch() {
    log.i("Navigating to search view");
    navigationService.navigateTo(Routes.searchView);
  }

  Future<void> fetchOgData(Bookmark bookmark) async {
    try {
      if (ogDataCache.containsKey(bookmark.link)) return;

      setBusyForObject(bookmark.link, true);

      final metadata = await MetadataFetch.extract(bookmark.link);

      if (metadata != null) {
        ogDataCache[bookmark.link] = BookmarkMetadata(
          title: metadata.title ?? getFallbackTitle(bookmark.link),
          description: metadata.description ?? '',
          imageUrl: metadata.image,
        );

        log.d("Fetched OG data for ${bookmark.link}: ${metadata.title}");
      }
    } catch (e) {
      log.e("Error fetching OG data for ${bookmark.link}: $e");
    } finally {
      setBusyForObject(bookmark.link, false);
      notifyListeners();
    }
  }

  // Helper method to get a title from the URL if OG data doesn't provide one
  String getFallbackTitle(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.host.replaceAll('www.', '');
    } catch (e) {
      return url;
    }
  }

  BookmarkMetadata getMetadata(String bookmarkLink) {
    if (!ogDataCache.containsKey(bookmarkLink)) {
      log.d("No cached OG data for $bookmarkLink, initializing with defaults");
      ogDataCache[bookmarkLink] = BookmarkMetadata(
        title: getFallbackTitle(bookmarkLink),
        description: '',
        imageUrl: null,
      );
    }
    return ogDataCache[bookmarkLink]!;
  }

  void addBookmark(Bookmark bookmark) {
    log.d("Adding bookmark: ${bookmark.link}");
    _bookmarks.add(bookmark);
    notifyListeners();
  }

  void handleSharingIntent() {
    log.i("Handling sharing intent");

    // Listen to media sharing coming from outside the app while the app is in the memory.
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      _sharedFiles.clear();
      _sharedFiles.addAll(value);
      // Add the shared files to the bookmarks and fetch OG data for each
      for (var file in _sharedFiles) {
        if (file.type == SharedMediaType.url) {
          var bookmark = Bookmark(link: file.path);
          addBookmark(bookmark);
          fetchOgData(bookmark);
          rebuildUi();
        }
      }
      notifyListeners();
      log.d(_sharedFiles.map((f) => f.toMap()));
    }, onError: (err) {
      log.e("getIntentDataStream error: $err");
    });

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      _sharedFiles.clear();
      _sharedFiles.addAll(value);
      // Add the shared files to the bookmarks and fetch OG data for each
      for (var file in _sharedFiles) {
        if (file.type == SharedMediaType.url) {
          var bookmark = Bookmark(link: file.path);
          addBookmark(bookmark);
          fetchOgData(bookmark);
        }
      }
      notifyListeners();
      log.d(_sharedFiles.map((f) => f.toMap()));

      // Tell the library that we are done processing the intent.
      ReceiveSharingIntent.instance.reset();
    });
  }
}
