import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:bookmark/utils/screen_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part 'search_viewmodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final font = FontTheme();
    return ViewModelBuilder<SearchViewmodel>.reactive(
      viewModelBuilder: () => SearchViewmodel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 38.w,
                          height: 38.h,
                          child: ClipOval(
                            child: TextButton(
                              onPressed: () {
                                model.clearSearch(context);
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 39, 39, 39),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.all(0.w)),
                              child: Text("✨",
                                  style: TextStyle(fontSize: 18.sp)),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            model.clearSearch(context);
                          },
                        ),
                        SizedBox(width: 8.w),
                      ],
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .slide(begin: const Offset(0, 0.3)),
              ),
              model.searchQuery.isNotEmpty
                  ? Expanded(
                      child: AnimatedSwitcher(
                        duration: 400.ms, // speed of animation
                        child: ScreenWrapper(
                          key: ValueKey(
                              model.searchQuery), // <-- this is important
                          child: CustomScrollView(
                            slivers: [
                              SliverPadding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                sliver: SliverMasonryGrid.count(
                                  crossAxisCount: 2,
                                  itemBuilder: (context, index) {
                                    final bookmark = model.bookmarks[index];
                                    return _buildBookmarkCard(bookmark, font)
                                        .animate()
                                        .fadeIn(
                                            duration: 400.ms,
                                            delay: (index * 100).ms)
                                        .slide(begin: const Offset(0, 0.1));
                                  },
                                  childCount: model.bookmarks.length,
                                  mainAxisSpacing: 10.h,
                                  crossAxisSpacing: 10.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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

Widget _buildBookmarkCard(Map<String, dynamic> bookmark, FontTheme font) {
  switch (bookmark['type']) {
    case 'twitter':
      return Card(
        color: Colors.black,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookmark['preview'],
                style:
                    font.body(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                bookmark['text'],
                style: font.caption(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Text(
                bookmark['username'],
                style: font.small(color: Colors.blue[400]),
              ),
            ],
          ),
        ),
      );
    case 'pinterest':
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12.r),
              ),
              child: Image.network(
                bookmark['image'],
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bookmark['info'],
                style: font.body(),
              ),
            ),
          ],
        ),
      );
    case 'website':
      return Card(
        color: Colors.blue[50],
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16.w,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      bookmark['favicon'],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      bookmark['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: font.body(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                bookmark['description'],
                style: font.caption(),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon:
                      const Icon(Icons.open_in_new_rounded, color: Colors.blue),
                  onPressed: () {
                    // Handle open website action
                  },
                ),
              ),
            ],
          ),
        ),
      );
    default:
      return const SizedBox.shrink();
  }
}
