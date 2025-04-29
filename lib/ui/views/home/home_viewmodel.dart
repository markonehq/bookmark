part of 'home_view.dart';

class Bookmark {
  String link;
  String title;
  String description;
  String? imageUrl;
  String createdAt;
  String? ogImage;

  Bookmark({
    required this.link,
    required this.title,
    required this.description,
    this.imageUrl,
    String? createdAt,
  }) : createdAt = createdAt ?? DateTime.now().toIso8601String();
}

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewModel");
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();
  final _pref = locator<LocalStorageService>();

  String name = "";
  String email = "";
  String avatar = "";
  String uid = "";
  final NavigationService navigationService = locator<NavigationService>();

  final Map<String, Bookmark> _ogDataCache = {};

  final List<Bookmark> _bookmarks = [
    Bookmark(
      link:
          "https://timesofindia.indiatimes.com/travel/destinations/places-to-visit-in-jammu-the-key-attractions-of-this-heavenly-land/articleshow/59557249.cms",
      title: "Google",
      description:
          "Search the world's information, including webpages, images, videos and more.",
      imageUrl:
          "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
    ),
    Bookmark(
      link: "https://www.github.com",
      title: "GitHub",
      description: "Where the world builds software.",
      imageUrl:
          "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
    ),
    Bookmark(
      link: "https://www.stackoverflow.com",
      title: "Stack Overflow",
      description:
          "A question and answer site for professional and enthusiast programmers.",
    ),
    Bookmark(
      link: "https://www.reddit.com",
      title: "Reddit",
      description: "The front page of the internet.",
      imageUrl:
          "https://www.redditstatic.com/desktop2x/img/favicon/apple-icon-57x57.png",
    ),
    Bookmark(
      link:
          "https://medium.com/@vpznc/free-mobbin-and-appshots-alternatives-for-ui-references-990d10f9e01f",
      title: "Medium not og",
      description:
          "A place where words matter. Read, write, and share stories that matter.",
      imageUrl:
          "https://www.redditstatic.com/desktop2x/img/favicon/apple-icon-57x57.png",
    ),
    Bookmark(
      link: "https://www.youtube.com/watch?v=r6lFBUytgDM",
      title: "Youtube",
      description:
          "Enjoy the videos and music you love, upload original content, and share it all with friends, family, and the world on YouTube.",
    )
  ];

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

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

  void init() async {
    setBusy(true);
    log.d("HomeViewModel initialized");
    name = _pref.read('name') ?? '';
    email = _pref.read('email') ?? '';
    avatar = _pref.read('avatar') ?? '';
    uid = _pref.read('uid') ?? '';
    for (var bookmark in _bookmarks) {
      await fetchOgData(bookmark);
    }
    setBusy(false);
  }

  void handleFileAction() {
    log.i("File action triggered");
    // Add your logic for handling files
  }

  void handleLinkAction() {
    log.i("Link action triggered");
    // Add your logic for handling links
  }

  void handleNoteAction() {
    log.i("Note action triggered");
    // Add your logic for handling notes
  }

  void handlePdfAction() {
    log.i("PDF action triggered");
    // Add your logic for handling PDFs
  }

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
            (bookmark.title.toLowerCase())
                .contains(searchQuery.toLowerCase()) ||
            (bookmark.description.toLowerCase())
                .contains(searchQuery.toLowerCase()) ||
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
      if (_ogDataCache.containsKey(bookmark.link)) return;

      final metadata = await MetadataFetch.extract(bookmark.link);

      if (metadata != null) {
        _ogDataCache[bookmark.link] = Bookmark(
          title: metadata.title ?? bookmark.title,
          description: metadata.description ?? bookmark.description,
          imageUrl: metadata.image ?? bookmark.imageUrl,
          link: bookmark.link,
        );
      }
    } catch (e) {
      log.e("Error fetching OG data for ${bookmark.link}: $e");
    } finally {
      notifyListeners();
    }
  }

  Bookmark getOgData(Bookmark bookmark) {
    if (!_ogDataCache.containsKey(bookmark.link)) {
      log.d("No cached OG data for ${bookmark.link}, using bookmark data");
      _ogDataCache[bookmark.link] = Bookmark(
        title: "${bookmark.title} (not fetched)",
        description: bookmark.description,
        imageUrl: bookmark.imageUrl,
        link: bookmark.link,
      );
    }
    return _ogDataCache[bookmark.link]!;
  }
}
