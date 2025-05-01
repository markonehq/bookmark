part of 'search_view.dart';

class SearchViewmodel extends BaseViewModel {
  void init() async {}

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

  List<Bookmark> get bookmarks {
    final HomeViewModel homeViewModel = locator<HomeViewModel>();
    if (searchQuery.isEmpty) {
      return homeViewModel.getBookmarks;
    }

    return homeViewModel.getBookmarks
        .where((bookmark) =>
            (bookmark.title.toLowerCase())
                .contains(searchQuery.toLowerCase()) ||
            (bookmark.description.toLowerCase())
                .contains(searchQuery.toLowerCase()) ||
            (bookmark.link.toLowerCase()).contains(searchQuery.toLowerCase()))
        .toList();
  }
}
