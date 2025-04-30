part of 'startup_view.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger("StartupViewModel");
  final _navigationService = locator<NavigationService>();
  final AuthService _auth = locator<AuthService>();
  final _pref = locator<LocalStorageService>();
  final font = FontTheme();

  Future runStartupLogic() async {
    try {
      if (_auth.currentUser != null &&
          _auth.currentUser!.uid.isNotEmpty &&
          _auth.currentUser!.isAnonymous == false &&
          _pref.read("uid") != null) {
        log.d("User is logged in");
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await _navigationService.clearStackAndShow(Routes.homeView);
        });
      } else {
        log.d("User is not logged in");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _navigationService.replaceWith(Routes.authView);
        });
      }
    } on Exception catch (e) {
      log.e("Error in runStartupLogic: $e");
    }
  }
}
