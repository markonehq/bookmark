import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/ui/common_widgets/loading_shimmer.dart';
import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/ui/views/search/search_view.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookmarkSummeryTabview extends ViewModelWidget<SearchViewmodel> {
  const BookmarkSummeryTabview({
    super.key,
  });

  @override
  Widget build(BuildContext context, SearchViewmodel viewModel) {
    final TabController tabController = TabController(
        length: viewModel.myTabs.length, vsync: Scaffold.of(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          controller: tabController,
          isScrollable: true,
          dividerHeight: 0.5,
          padding: EdgeInsets.only(left: 16.w),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 0.w),
          indicatorColor: const Color.fromARGB(255, 0, 0, 0),
          labelColor: const Color.fromARGB(255, 0, 0, 0),
          unselectedLabelColor: const Color.fromARGB(179, 33, 33, 33),
          labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          tabs: viewModel.myTabs,
        ),
      ),
      body: TabBarView(controller: tabController, children: const [
        Center(
          child: SizedBox(
            child: Text("Summery"),
          ),
        ),
        Center(
          child: SizedBox(
            child: Text("Sources"),
          ),
        )
      ]),
    ).animate().fadeIn(duration: 400.ms).slide(begin: const Offset(0, 0.2));
  }
}

Widget buildBookmarkSearchPage(Bookmark data, FontTheme font,
    SearchViewmodel viewModel, BuildContext context) {
  final title = data.title;
  // final description = data.description;
  final imageUrl = data.imageUrl;
  final link = data.link;

  return Card(
    elevation: 0.1,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    color: context.colorScheme.card,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 150,
          child: Image.network(
            imageUrl ?? data.ogImage ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child.animate().fadeIn(duration: 400.ms);
              } else {
                return buildShimmer(
                  height: 150,
                  borderRadius: BorderRadius.circular(12),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(12.w),
          child: Text(
            title,
            style: font.b3(fontWeight: FontWeight.w500),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // if (description.isNotEmpty)
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 12.w),
        //     child: Text(
        //       description,
        //       style: font.caption(color: Colors.grey[700]),
        //       maxLines: 2,
        //       overflow: TextOverflow.ellipsis,
        //     ),
        //   ),

        // Link section
        if (link.isNotEmpty)
          Padding(
            padding:
                EdgeInsets.only(left: 12.w, right: 12.w, bottom: 4.w, top: 0.w),
            child: Row(
              children: [
                Icon(Icons.link, size: 16, color: Colors.blue[700]),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    link
                        .replaceAll(RegExp(r'^(https?:\/\/)?(www\.)?'), '')
                        .split('/')[0],
                    style: font.b3(color: Colors.blue[700]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
