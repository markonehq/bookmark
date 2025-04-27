part of 'search_sheet.dart';

class SearchSheetModel extends BaseViewModel {
  final log = getLogger("SearchSheetModel");

  String selectedTab = 'summary'; // Default tab
  String summaryMarkdown = '''
# Summary
This is a **Markdown** summary of the search result. It includes:
- Key points
- Highlights
- Insights
  ''';

  List<String> sources = [
    'Source 1: https://example.com',
    'Source 2: https://another-example.com',
    'Source 3: https://yet-another-example.com',
  ];

  void setSelectedTab(String tab) {
    selectedTab = tab;
    notifyListeners();
  }

  void init() {
    // Initialize any data or state here
  }
}
