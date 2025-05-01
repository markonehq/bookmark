import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/ui/common_widgets/loading_circular.dart';
import 'package:bookmark/ui/common_widgets/loading_shimmer.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:bookmark/utils/screen_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'
    show SliverMasonryGrid;
import 'package:metadata_fetch/metadata_fetch.dart';

part 'home_viewmodel.dart';
part 'home_view_components.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final font = FontTheme();
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: context.colorScheme.black,
            childrenButtonSize: Size(50.w, 60.h),
            foregroundColor: context.colorScheme.white,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            spacing: 10,
            spaceBetweenChildren: 5,
            children: [
              SpeedDialChild(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: const Icon(Icons.insert_drive_file),
                backgroundColor: context.colorScheme.black,
                foregroundColor: context.colorScheme.white,
                // label: 'Files',
                onTap: () {
                  viewModel.handleFileAction();
                },
              ),
              SpeedDialChild(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: const Icon(Icons.link),
                backgroundColor: context.colorScheme.black,
                foregroundColor: context.colorScheme.white,
                // label: 'Links',
                onTap: () {
                  viewModel.handleLinkAction();
                },
              ),
              SpeedDialChild(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: const Icon(Icons.note),
                backgroundColor: context.colorScheme.black,
                foregroundColor: context.colorScheme.white,
                // label: 'Notes',
                onTap: () {
                  viewModel.handleNoteAction();
                },
              ),
              SpeedDialChild(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: const Icon(Icons.picture_as_pdf),
                backgroundColor: context.colorScheme.black,
                foregroundColor: context.colorScheme.white,
                // label: 'PDFs',
                onTap: () {
                  viewModel.handlePdfAction();
                },
              ),
            ],
          ),
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: GestureDetector(
                  onTap: () {
                    viewModel.showSettingBottomSheet();
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(viewModel.avatar),
                    radius: 20.w,
                    backgroundColor: Colors.grey[300],
                  )),
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
                      ))
                  : null,
            ),
            actions: [
              if (!viewModel._isSearching)
                IconButton(
                  padding: EdgeInsets.only(right: 16.w),
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    viewModel.navigateToSearch();
                    // viewModel._isSearching = true;
                    // viewModel.notifyListeners();
                  },
                ),
            ],
          ),
          body: !viewModel.isBusy
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.yellow[400]!,
                        Colors.yellow[100]!,
                        Colors.yellow[100]!,
                        Colors.yellow[50]!,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                      ],
                    ).withOpacity(0.5),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: ScreenWrapper(
                        child: CustomScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          slivers: [
                            SliverPadding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              sliver: SliverMasonryGrid.count(
                                crossAxisCount: 2,
                                itemBuilder: (context, index) {
                                  final link = viewModel.bookmarks[index].link;
                                  final bookmark =
                                      HomeViewModel.ogDataCache[link] ??
                                          viewModel.bookmarks[index];

                                  return buildBookmarkCard(
                                          data: bookmark,
                                          font: font,
                                          context: context)
                                      .animate()
                                      .fadeIn(
                                          duration: 400.ms,
                                          delay: (index * 100).ms)
                                      .slide(begin: const Offset(0, 0.1));
                                },
                                childCount: viewModel.bookmarks.length,
                                mainAxisSpacing: 4.h,
                                crossAxisSpacing: 4.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : loadingCircular(),
        ),
      ),
    );
  }
}
