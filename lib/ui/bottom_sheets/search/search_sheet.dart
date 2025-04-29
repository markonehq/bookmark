import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

part 'search_sheet_model.dart';

class SearchSheet extends StackedView<SearchSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const SearchSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchSheetModel viewModel,
    Widget? child,
  ) {
    final font = FontTheme();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.w)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Search',
                style: font.b3(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align chips to the left
              children: [
                ChoiceChip(
                  label: const Text(
                    'Summary',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                  selected: viewModel.selectedTab == 'summary',
                  onSelected: (isSelected) {
                    if (isSelected) viewModel.setSelectedTab('summary');
                  },
                  selectedColor: Colors.black, // Black background when selected
                  backgroundColor:
                      Colors.grey[400], // Grey background when not selected
                ),
                SizedBox(width: 8.w),
                ChoiceChip(
                  label: const Text(
                    'Sources',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                  selected: viewModel.selectedTab == 'sources',
                  onSelected: (isSelected) {
                    if (isSelected) viewModel.setSelectedTab('sources');
                  },
                  selectedColor: Colors.black, // Black background when selected
                  backgroundColor:
                      Colors.grey[400], // Grey background when not selected
                ),
              ],
            ),
            SizedBox(height: 16.h),
            if (viewModel.selectedTab == 'summary')
              MarkdownBody(
                data: viewModel.summaryMarkdown,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
              ),
            if (viewModel.selectedTab == 'sources')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: viewModel.sources.map((source) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Row(
                      children: [
                        const Icon(Icons.done_outlined, size: 8),
                        SizedBox(width: 8.w),
                        Expanded(child: Text(source, style: font.b3())),
                      ],
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  @override
  SearchSheetModel viewModelBuilder(BuildContext context) => SearchSheetModel();
}
