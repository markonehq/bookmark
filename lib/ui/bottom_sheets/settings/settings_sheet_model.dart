part of 'settings_sheet.dart';

class SettingsSheetModel extends BaseViewModel {
  final log = getLogger("SettingsSheetModel");
  final _pref = locator<LocalStorageService>();
  final NavigationService navigation = locator<NavigationService>();
  String username = 'hwl';
  String email = '';
  String avatar = '';

  // bool isDarkMode = false;

  // void toggleMode() {
  //   isDarkMode = !isDarkMode;
  //   notifyListeners();
  // }

  void init() {
    // Initialize any data or state here
    username = _pref.read('name') ?? '';
    email = _pref.read('email') ?? '';
    avatar = _pref.read('avatar') ?? '';

    log.d("SettingsSheetModel initialized");
    log.d("Username: $username");
    log.d("Email: $email");
    log.d("Avatar: $avatar");
    notifyListeners();
  }

  void logout() async {
    setBusy(true);
    await GoogleSignIn().signOut();
    await AuthService().signOut();
    navigation.clearStackAndShow(Routes.authView);
    setBusy(false);
  }
}
