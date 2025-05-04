import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/ui/views/search/search_viewcomponents.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:bookmark/utils/screen_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part 'search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewmodel>.reactive(
      viewModelBuilder: () => SearchViewmodel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            toolbarHeight: 80.h, // Reduced from 100.h
            backgroundColor: context.colorScheme.backgroundLight,
            titleSpacing: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => model.navigationService.back(),
            ),
            leadingWidth: 50.w,
            title: Padding(
              padding: EdgeInsets.only(right: 16.h),
              child: TextField(
                controller: model._searchController,
                autofocus: true,
                onChanged: model.updateSearchQuery,
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.w),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  isDense: true, // Makes the field more compact
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8.h), // Reduced internal padding
                  prefixIcon: const Icon(Icons.search),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 36.w), // Smaller prefix
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 32.w, // Slightly smaller
                        height: 32.h, // Slightly smaller
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.w),
                          child: TextButton(
                            onPressed: () {
                              model.showSummery();
                            },
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 39, 39, 39),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(0)),
                            child:
                                Text("💫", style: TextStyle(fontSize: 14.sp)),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        constraints: BoxConstraints(
                            minWidth: 36.w), // Smaller close button
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          model.clearSearch(context);
                        },
                      ),
                      8.horizontalSpace,
                    ],
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slide(begin: const Offset(0, 0.3)),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  model.searchQuery.isNotEmpty && !model._isShowSummery
                      ? Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: ScreenWrapper(
                              child: CustomScrollView(
                                keyboardDismissBehavior:
                                    ScrollViewKeyboardDismissBehavior.onDrag,
                                slivers: [
                                  SliverPadding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.h),
                                    sliver: SliverMasonryGrid.count(
                                      crossAxisCount: 2,
                                      itemBuilder: (context, index) {
                                        final link =
                                            model.bookmarks[index].link;
                                        return buildBookmarkCard(link, context)
                                            .animate()
                                            .fadeIn(
                                                duration: 400.ms,
                                                delay: (index * 100).ms)
                                            .slide(
                                              begin: const Offset(0, 0.1),
                                            );
                                      },
                                      childCount: model.bookmarks.length,
                                      mainAxisSpacing: 4.h,
                                      crossAxisSpacing: 4.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : model._isShowSummery
                          ? const Expanded(child: BookmarkSummeryTabview())
                          : const Expanded(
                              child: Center(
                                child: Text(
                                  "Search for bookmarks",
                                ),
                              ),
                            ),
                ],
              ),
            ),
          )),
    );
  }
}
