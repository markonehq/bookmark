part of 'startup_view.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger("StartupViewModel");
  final _navigationService = locator<NavigationService>();
  final AuthService _auth = locator<AuthService>();
  final _pref = locator<LocalStorageService>();
  final font = FontTheme();

  Future runStartupLogic() async {
    log.d("Running startup logic...");
    try {
      await Future.delayed(2000.ms);

      if (_auth.currentUser != null && _pref.read("uid") != null) {
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle: Transition.downToUp,
          duration: 600.ms,
          curve: Curves.easeInOut,
        );
      } else {
        _navigationService.clearStackAndShow(Routes.authView);
      }
    } on Exception catch (e) {
      log.e("Error in startup logic: $e");
      _navigationService.clearStackAndShow(Routes.authView);
    }
  }
}
