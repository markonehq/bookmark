part of 'bottom_nav_view.dart';

class BottomNavViewModel extends IndexTrackingViewModel {
  final log = getLogger('BottomNavViewModel');
  void init() {}

  Widget getViewForCurrentIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const HomeView();
      case 2: 
        return const HomeView();
      default:
        return const HomeView();
    }
  }
}
