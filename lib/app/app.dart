import 'package:bookmark/services/auth_service.dart';
import 'package:bookmark/services/firestore_service.dart';
import 'package:bookmark/ui/bottom_sheets/search/search_sheet.dart';
import 'package:bookmark/ui/views/auth/auth_view.dart';
import 'package:bookmark/ui/views/onboarding/onboarding_view.dart';
import 'package:bookmark/ui/views/search/search_view.dart';
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
    MaterialRoute(page: AuthView),
    MaterialRoute(page: SearchView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: HomeViewModel),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: SettingsSheet),
    StackedBottomsheet(classType: SearchSheet),
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
