import 'dart:async';

import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/ui/common_widgets/loading_circular.dart';
import 'package:bookmark/ui/common_widgets/loading_shimmer.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:bookmark/utils/screen_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

part 'home_view_components.dart';
part 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: GestureDetector(
                  onTap: viewModel.showSettingBottomSheet,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(viewModel.avatar),
                    radius: 20.w,
                    backgroundColor: Colors.grey[300],
                  )),
            ),
            title: Center(
              child: Text(
                'BookMark',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
            actionsPadding: EdgeInsets.only(right: 8.w),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: viewModel.navigateToSearch,
              ),
            ],
          ),
          body: Container(
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
            child: !viewModel.isBusy
                ? GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: ScreenWrapper(
                        child: CustomScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          cacheExtent: 1000,
                          slivers: [
                            SliverPadding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              sliver: SliverMasonryGrid.count(
                                crossAxisCount: 2,
                                itemBuilder: (context, index) {
                                  final link = viewModel.bookmarks[index].link;
                                  return RepaintBoundary(
                                    child: buildBookmarkCard(link, context)
                                        .animate()
                                        .fadeIn(
                                            duration: 400.ms,
                                            delay: (index * 100).ms)
                                        .slide(begin: const Offset(0, 0.1)),
                                  );
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
                  )
                : loadingCircular(),
          )),
    );
  }
}
