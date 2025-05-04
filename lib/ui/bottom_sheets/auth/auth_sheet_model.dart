part of 'auth_sheet.dart';

class AuthSheetModel extends BaseViewModel {
  final log = getLogger("AuthSheetModel");
  final NavigationService navigationService = locator<NavigationService>();
  final AuthService authService = locator<AuthService>();
  void init() {
    log.d("AuthViewModel initialized");
  }

  Future<void> login() async {
    setBusy(true);
    try {
      loadingCircular();
      final bool status = await authService.signInWithGoogle();
      if (status) {
        log.d("Login successful");
        navigationService.navigateTo(Routes.onboardingView);
      } else {
        log.d("Login failed");
      }
    } catch (e) {
      log.e("Login failed: $e");
    } finally {
      setBusy(false);
    }
  }
}
