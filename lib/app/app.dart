import 'package:bookmark/ui/views/onboarding/onboarding_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/services/theme_service.dart';
import 'package:bookmark/ui/bottom_sheets/settings/settings_sheet.dart';
import 'package:bookmark/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/ui/views/startup/startup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: OnboardingView),
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
    StackedBottomsheet(classType: SettingsSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}

// dart run build_runner build --delete-conflicting-outputs
