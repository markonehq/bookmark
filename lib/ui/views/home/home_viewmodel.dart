part of 'home_view.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger("HomeViewModel");
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  final List<Map<String, dynamic>> _bookmarks = [
    {
      'type': 'pinterest',
      'image':
          'https://imgs.search.brave.com/Pfc7OQEbpvC-2yiVepRcMrsH72ch418u9PeNrm7uCpQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9taXIt/czMtY2RuLWNmLmJl/aGFuY2UubmV0L3By/b2plY3RfbW9kdWxl/cy8xNDAwL2M3NTQ2/ODY2Nzg1MDEzLjVi/MjU4ZDI5YzJjNDcu/cG5n',
      'info': 'Pinterest Board: Modern UI Concepts',
    },
    {
      'type': 'twitter',
      'preview': 'Exciting Flutter News!',
      'text': 'Flutter 3.0 is here with amazing new features.',
      'username': '@flutternews',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/LgubNhZ1pon-fwzc5KNGU2MTPRLPF5hG7yvxuHO4_ps/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ncmF2/YXRhci5jb20vaW1h/Z2VzL2hvbWVwYWdl/L2F2YXRhci0wOC5w/bmc',
      'title': 'React Documentation',
      'description': 'Learn how to build user interfaces with React.',
    },
    {
      'type': 'pinterest',
      'image':
          'https://i.pinimg.com/736x/bb/ba/bf/bbbabf3d4da84ba5fcefe348918bb1f6.jpg',
      'info': 'Pinterest Board: App Development',
    },
    {
      'type': 'twitter',
      'preview': 'Dart Tips & Tricks',
      'text': 'Learn how to optimize your Dart code for performance.',
      'username': '@darttips',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/1ack4jU3uBX-FOTsAiyidYh_M3wxaXqJeevt9W5IxFw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9taXJv/Lm1lZGl1bS5jb20v/djIvMSo1LWFvSzhJ/Qm1YdmU1d2hCUU05/MEdBLnBuZw',
      'title': 'Flutter Documentation',
      'description': 'Comprehensive guide to Flutter development.',
    },
    {
      'type': 'pinterest',
      'image':
          'https://imgs.search.brave.com/aeH0l1M8-bDYPMjxVDN2eqm-qz_X32Uqvkqo51D3Ynk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTM1/NzUzMDA3OS9waG90/by9sb3ZpbmctZmFt/aWx5LWdvaW5nLW9u/LWhvbGlkYXktdG9n/ZXRoZXIuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPWpNOGpI/bzZHMXhXOWF3V0df/Qi1GeGFCOC02SUhV/YU1pMmp5VUJFbWdm/ejA9',
      'info': 'Pinterest Board: Travel Photography',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/P2JpYYfGi9YLJj4wYl7XIMJRXWXdfYVjs6cojMViQOw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ncmF2/YXRhci5jb20vaW1h/Z2VzL2hvbWVwYWdl/L2F2YXRhci0wOS5w/bmc',
      'title': 'Dart Programming Language',
      'description': 'Learn Dart, the language behind Flutter.',
    },
    {
      'type': 'twitter',
      'preview': 'Healthy Eating Tips',
      'text': '5 superfoods to include in your diet for better health.',
      'username': '@healthyliving',
    },
    {
      'type': 'pinterest',
      'image':
          'https://imgs.search.brave.com/Em2oJBlR2WJbWKaRZYNWaECwhaZounE6LDmhAp13IRw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YW5kYWNhZGVteS5j/b20vcmVzb3VyY2Vz/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDI1/LzAzL2ltYWdlMTAt/My0xMDI0eDU0NC5w/bmc',
      'info': 'Pinterest Board: Creative App Designs',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/I0WAklE532XnupZ-lRrOPrz57m-uJup0oUEZLBEigww/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/c3RlZmFuanVkaXMu/Y29tL2R1ZGUtbmV3/c2xldHRlci5zdmc',
      'title': 'GitHub',
      'description': 'Explore open-source projects and repositories.',
    },
    {
      'type': 'twitter',
      'preview': 'Travel Inspiration',
      'text': 'Discover the top 10 destinations to visit in 2025!',
      'username': '@travelguide',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/8bo31qsb5M9h8aDMqTKzCEQvat2oy1yJTcoQD1aScWU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBy/YXZhdGFyLmNjLzE1/MD9pbWc9MTA',
      'title': 'Lonely Planet',
      'description': 'Your ultimate travel guide to explore the world.',
    },
    {
      'type': 'website',
      'favicon':
          'https://imgs.search.brave.com/-IzBPPgh9bwhtA8CWVJWHqQb9A5T_4BNwnvPOdWuQYg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/YXZhdGFyLW9mZmlj/aWFsLWNvb2NrYm9v/Y2stdjAtcnZ4aXNn/ODJzaTJjMS5qcGc_/d2lkdGg9NjQwJmNy/b3A9c21hcnQmYXV0/bz13ZWJwJnM9N2Iz/ZjY5MjI0OTYzNjhi/ZjJmOTg5ODJiYjc1/OTZjZDRkODBmZDcz/MQ',
      'title': 'AllRecipes',
      'description': 'Find and share everyday cooking inspiration.',
    },
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

  void init() {
    log.i("HomeViewModel initialized");
  }

  Future showCustomBottomSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.settings,
      ignoreSafeArea: true,
      enableDrag: true,
      barrierDismissible: true,
      isScrollControlled: true,
    );
  }

  List<Map<String, dynamic>> get bookmarks {
    if (searchQuery.isEmpty) {
      return _bookmarks;
    }

    return _bookmarks
        .where((bookmark) =>
            (bookmark['title']?.toLowerCase() ?? '')
                .contains(searchQuery.toLowerCase()) ||
            (bookmark['text']?.toLowerCase() ?? '')
                .contains(searchQuery.toLowerCase()) ||
            (bookmark['info']?.toLowerCase() ?? '')
                .contains(searchQuery.toLowerCase()))
        .toList();
  }

  void onSearchIconTap() {
    _isSearching = !_isSearching;
    notifyListeners();
  }
}
