part of 'search_view.dart';

class SearchViewmodel extends BaseViewModel {
  void init() async {
    setBusy(true);
    for (var bookmark in _bookmarks) {
      fetchOgData(bookmark);
    }
    setBusy(false);
  }

  final log = getLogger("SearchViewmodel");
  final NavigationService navigationService = locator<NavigationService>();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  bool _isShowSummery = false;
  bool get isShowSummery => _isShowSummery;
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Summery'),
    const Tab(text: 'Sources'),
  ];
  final Map<String, Bookmark> _ogDataCache = {};

  final List<Bookmark> _bookmarks = [
    Bookmark(
      link: "https://www.google.com",
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

  // List<Map<String, dynamic>> get bookmarks {
  //   if (searchQuery.isEmpty) {
  //     log.d("No search query, returning all bookmarks");
  //     log.i("Bookmarks: $_bookmarks");
  //     log.i("Search query: $searchQuery");
  //     return _bookmarks;
  //   }

  //   log.i("Filtering bookmarks with search query: $searchQuery");
  //   return _bookmarks
  //       .where((bookmark) =>
  //           (bookmark['title']?.toLowerCase() ?? '')
  //               .contains(searchQuery.toLowerCase()) ||
  //           (bookmark['text']?.toLowerCase() ?? '')
  //               .contains(searchQuery.toLowerCase()) ||
  //           (bookmark['info']?.toLowerCase() ?? '')
  //               .contains(searchQuery.toLowerCase()))
  //       .toList();
  // }

  void updateSearchQuery(String query) {
    _isShowSummery = false;
    log.i("Search query updated: $query");
    _searchQuery = query;
    notifyListeners();
  }

  void clearSearch(BuildContext context) {
    _searchQuery = '';
    _searchController.clear();
    _isShowSummery = false;
    FocusScope.of(context).unfocus();
    log.i("Search query cleared");
    notifyListeners();
  }

  void showSummery() {
    _isShowSummery = true;
    log.i("Showing summary of bookmarks");
    notifyListeners();
    // Implement the logic to show a summary of bookmarks here
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
}
