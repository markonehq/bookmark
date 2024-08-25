import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yourappname/services/local_storage_service.dart';
import 'package:yourappname/services/theme_service.dart';
import 'package:yourappname/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:yourappname/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:yourappname/ui/views/home/home_view.dart';
import 'package:yourappname/ui/views/startup/startup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: LocalStorageService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}

// dart run build_runner build --delete-conflicting-outputs

