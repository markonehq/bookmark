part of 'auth_view.dart';

class AuthViewModel extends BaseViewModel {
  final log = getLogger("AuthViewModel");
  final NavigationService navigationService = locator<NavigationService>();
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();
  void init() {
    log.d("AuthViewModel initialized");
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
