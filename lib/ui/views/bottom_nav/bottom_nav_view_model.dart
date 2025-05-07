part of 'bottom_nav_view.dart';

class BottomNavViewModel extends IndexTrackingViewModel {
  final log = getLogger('BottomNavViewModel');

  final PageController pageController = PageController();
  @override
  int currentIndex = 0;

  void init() {
    // You can add init logic here if needed
  }

  @override
  void setIndex(int value) {
    pageController.jumpToPage(value); // or animateToPage if needed
    currentIndex = value;
    notifyListeners();
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> get pages => const [
        HomeView(),
        HomeView(), // Replace with actual view
        HomeView(), // Replace with actual view
      ];
}

  // Widget getViewForCurrentIndex(int index) {
  //   switch (index) {
  //     case 0:
  //       return const HomeView();
  //     case 1:
  //       return const HomeView();
  //     case 2: 
  //       return const HomeView();
  //     default:
  //       return const HomeView();
  //   }
  // }
