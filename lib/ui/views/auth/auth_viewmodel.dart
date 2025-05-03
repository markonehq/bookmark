part of 'auth_view.dart';

class AuthViewModel extends BaseViewModel {
  final log = getLogger("AuthViewModel");
  final NavigationService navigationService = locator<NavigationService>();
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();
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

  Future showAuthSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.auth,
      ignoreSafeArea: true,
      enableDrag: true,
      barrierDismissible: true,
      isScrollControlled: true,
    );
  }
}
