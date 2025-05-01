import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_svg/svg.dart';
part 'settings_sheet_model.dart';

class SettingsSheet extends StackedView<SettingsSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const SettingsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsSheetModel viewModel,
    Widget? child,
  ) {
    final font = FontTheme();
    return ViewModelBuilder.nonReactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => SettingsSheetModel(),
        disposeViewModel: false,
        onDispose: (model) {
          model.dispose();
        },
        builder: (context, viewModel, child) => SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                  top: 6.h,
                  left: 6.w,
                  right: 6.w,
                  bottom: 0.h,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.white.withAlpha(252),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24.w)),
                ),
                child: Wrap(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 6.h,
                              left: 6.w,
                              right: 6.w,
                              bottom: 0.h,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            decoration: BoxDecoration(
                              color: context.colorScheme.white.withAlpha(252),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24.w),
                                  bottom: Radius.circular(24.w)),
                            ),
                            child: Wrap(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/settings/gear.svg",
                                      width: 50.w,
                                      height: 50.h,
                                      colorFilter: ColorFilter.mode(
                                          Colors.deepOrange[600]!,
                                          BlendMode.srcIn),
                                    ),
                                    Text(
                                      "General",
                                      style: font.b1(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    6.verticalSpace,
                                    Text(
                                      "Manage your name, spaces, and access information such as support and privacy information.",
                                      style: font.b3(
                                        // fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    20.verticalSpace,
                                  ],
                                ),

                                // Profile Section

                                Card.outlined(
                                  margin: EdgeInsets.only(bottom: 4.h),
                                  color: context.colorScheme.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12).r,
                                    side: BorderSide(
                                      color: context.colorScheme.grey
                                          .withAlpha(40),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0).r,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100).r,
                                          child: Image.network(
                                            viewModel.avatar,
                                            fit: BoxFit.cover,
                                            width: 50.w,
                                            height: 50.h,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Icon(
                                                Icons.person,
                                                size: 40.w,
                                                color: Colors.grey,
                                              );
                                            },
                                          ),
                                        ),
                                        15.horizontalSpace,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              viewModel.username,
                                              style: font.b1(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              viewModel.email,
                                              style: font.b3(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Spaces Section
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Spaces",
                                      style: font.b3(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add,
                                          color: Colors.blue),
                                      onPressed: () {
                                        // Handle create space action
                                      },
                                    ),
                                  ],
                                ),

                                Card.outlined(
                                  margin: EdgeInsets.only(bottom: 20.h),
                                  color: context.colorScheme.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12).r,
                                    side: BorderSide(
                                      color: context.colorScheme.grey
                                          .withAlpha(40),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12).r,
                                        ),
                                        leading: Icon(Icons.folder,
                                            color: Colors.orange[700]),
                                        title: Text(
                                          "Pinterest",
                                          style: font.b3(),
                                        ),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12).r,
                                        ),
                                        leading: Icon(Icons.folder,
                                            color: Colors.orange[700]),
                                        title: Text(
                                          "UI Design",
                                          style: font.b3(),
                                        ),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12).r,
                                        ),
                                        leading: Icon(Icons.folder,
                                            color: Colors.orange[700]),
                                        title: Text(
                                          "App Development",
                                          style: font.b3(),
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),

                                // Settings Section
                                Text(
                                  "Settings",
                                  style: font.b3(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                // 10.verticalSpace,
                                // ListTile(
                                //   title: Text(
                                //     "Theme",
                                //     style: font.b3(),
                                //   ),
                                //   trailing: CupertinoSwitch(
                                //     activeTrackColor: Colors.amber,
                                //     thumbColor: Colors.white,
                                //     inactiveTrackColor: Colors.grey[300],
                                //     value: viewModel.isDarkMode,
                                //     onChanged: (value) {
                                //       viewModel.toggleMode();
                                //     },
                                //   ),
                                // ),

                                Card.outlined(
                                  margin:
                                      EdgeInsets.only(bottom: 20.h, top: 12.h),
                                  color: context.colorScheme.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: context.colorScheme.grey
                                          .withAlpha(40),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        leading: Icon(
                                          Icons.ios_share_rounded,
                                          color: Colors.orange[700],
                                        ),
                                        title: Text(
                                          "Share App",
                                          style: font.b3(),
                                        ),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        leading: Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.orange[700],
                                        ),
                                        title: Text(
                                          "Rate App",
                                          style: font.b3(),
                                        ),
                                        onTap: () {},
                                      ),
                                      ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        leading: Icon(
                                          Icons.bug_report_rounded,
                                          color: Colors.orange[700],
                                        ),
                                        title: Text(
                                          "Bug Report",
                                          style: font.b3(),
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ])
                ]))));
  }

  @override
  SettingsSheetModel viewModelBuilder(BuildContext context) =>
      SettingsSheetModel();
}
