part of 'bottom_nav_view.dart';

class BottomNavViewModel extends IndexTrackingViewModel {
  final log = getLogger("BottomNavViewModel");
  final NavigationService navigationService = locator<NavigationService>();
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();
  final LocalStorageService localStorageService =
      locator<LocalStorageService>();
  void init() async {}

  Widget getViewForIndex(int currentIndex) {
    log.i("Current Index: $currentIndex");
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const ChatView();
      default:
        return const HomeView();
    }
  }

  Future showCustomBottomSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.settings,
      ignoreSafeArea: true,
      enableDrag: true,
      barrierDismissible: true,
      isScrollControlled: true, // Allow the bottom sheet to expand fully
    );
  }

  Future<bool> onPop() async {
    if (currentIndex != 0) {
      setIndex(0);
      return false;
    }
    return true;
  }

  void setNavIndex(int value) {
    setIndex(value);
  }
}
