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
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 40.h,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: GestureDetector(
              onTap: () {
                viewModel.showSettingBottomSheet();
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://imgs.search.brave.com/nDr89etkh9EIRa6XoIrs7H-H85JZ16PHYa01Sdnftws/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWd2/My5mb3Rvci5jb20v/aW1hZ2VzL2dhbGxl/cnkvZ2VuZXJhdGUt/YS1yZWFsaXN0aWMt/YWktYXZhdGFyLW9m/LWEtZmFzaGlvbi1t/YW4taW4tZm90b3Iu/anBn",
                ),
              ),
            ),
          ),
          title: AnimatedContainer(
            padding: EdgeInsets.only(left: 10.w),
            duration: const Duration(milliseconds: 300),
            alignment: viewModel._isSearching
                ? Alignment.centerRight
                : Alignment.centerLeft,
            width: viewModel._isSearching
                ? MediaQuery.of(context).size.width - 90.w
                : 0,
            curve: Curves.easeInOut,
            child: viewModel._isSearching
                ? TextField(
                    controller: viewModel._searchController,
                    autofocus: true,
                    onSubmitted: (String value) {
                      viewModel.showSearchBottomSheet();
                    },
                    cursorColor: Colors.orangeAccent[200],
                    onChanged: viewModel.updateSearchQuery,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.w),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          viewModel.clearSearch();
                        },
                      ),
                    ),
                  )
                : null,
          ),
          actions: [
            if (!viewModel._isSearching)
              IconButton(
                padding: EdgeInsets.only(right: 16.w),
                icon: const Icon(Icons.search),
                onPressed: () {
                  viewModel._isSearching = true;
                  viewModel.notifyListeners();
                },
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            // Handle add bookmark action
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Dismiss the keyboard
          },
          child: Stack(
            children: [
              // Main Content
              ScreenWrapper(
                child: CustomScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                      .onDrag, // Automatically dismiss keyboard on drag
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      sliver: SliverMasonryGrid.count(
                        crossAxisCount: 2,
                        itemBuilder: (context, index) {
                          final bookmark = viewModel.bookmarks[index];
                          return _buildBookmarkCard(bookmark, font);
                        },
                        childCount: viewModel.bookmarks.length,
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
