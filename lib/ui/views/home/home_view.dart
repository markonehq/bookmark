import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:bookmark/utils/screen_wrapper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final font = FontTheme();
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.incrementCounter(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            // Handle add bookmark action
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        body: Stack(
          children: [
            // Main Content
            ScreenWrapper(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    sliver: SliverMasonryGrid.count(
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        final bookmark = model.bookmarks[index];
                        return _buildBookmarkCard(bookmark, font);
                      },
                      childCount: model.bookmarks.length,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                    ),
                  ),
                ],
              ),
            ),
            // Fade Effect
            Positioned(
              top: 95.h,
              left: 0,
              right: 0,
              child: Container(
                height: 40.0.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.colorScheme.scaffoldColor,
                      context.colorScheme.scaffoldColor.withOpacity(0.9),
                      context.colorScheme.scaffoldColor.withOpacity(0.8),
                      context.colorScheme.scaffoldColor.withOpacity(0.7),
                      context.colorScheme.scaffoldColor.withOpacity(0.6),
                      context.colorScheme.scaffoldColor.withOpacity(0.5),
                      context.colorScheme.scaffoldColor.withOpacity(0.4),
                      context.colorScheme.scaffoldColor.withOpacity(0.3),
                      context.colorScheme.scaffoldColor.withOpacity(0.2),
                      context.colorScheme.scaffoldColor.withOpacity(0.1),
                      context.colorScheme.scaffoldColor.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                  style: font.body(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  bookmark['text'],
                  style: font.caption(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  bookmark['username'],
                  style: font.small(color: Colors.grey[400]),
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
                    icon: const Icon(Icons.open_in_new_rounded,
                        color: Colors.blue),
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
}
