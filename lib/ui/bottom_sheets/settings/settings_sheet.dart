import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter/cupertino.dart';

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.w)),
        ),
        child: Wrap(
          children: [
            // Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 40, color: Colors.grey[700]),
                ),
                15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: font.medium(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "johndoe@hotlook.com",
                      style: font.caption(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            20.verticalSpace,

            // Spaces Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spaces",
                  style: font.medium(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    // Handle create space action
                  },
                ),
              ],
            ),
            5.verticalSpace,
            // Dummy Spaces with Icons
            ListTile(
              leading: Icon(Icons.folder, color: Colors.orange[700]),
              title: Text(
                "Pinterest",
                style: font.body(),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.folder, color: Colors.orange[700]),
              title: Text(
                "UI Design",
                style: font.body(),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.folder, color: Colors.orange[700]),
              title: Text(
                "App Development",
                style: font.body(),
              ),
              onTap: () {},
            ),

            20.verticalSpace,

            // Settings Section
            Text(
              "Settings",
              style: font.medium(fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            ListTile(
              title: Text(
                "Theme",
                style: font.body(),
              ),
              trailing: CupertinoSwitch(
                activeTrackColor: Colors.amber,
                thumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[300],
                value: viewModel.isDarkMode,
                onChanged: (value) {
                  viewModel.toggleMode();
                },
              ),
            ),
            ListTile(
              title: Text(
                "Share App",
                style: font.body(),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Rate App",
                style: font.body(),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Bug Report",
                style: font.body(),
              ),
              onTap: () {},
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  SettingsSheetModel viewModelBuilder(BuildContext context) =>
      SettingsSheetModel();
}
