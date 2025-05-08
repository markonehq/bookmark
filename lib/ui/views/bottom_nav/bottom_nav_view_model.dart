part of 'bottom_nav_view.dart';

class BottomNavViewModel extends IndexTrackingViewModel {
  final log = getLogger('BottomNavViewModel');

  final PageController pageController = PageController();
  @override
  int currentIndex = 0;

  void init() {}

  @override
  void setIndex(int value) {
    pageController.jumpToPage(value);
    currentIndex = value;
    notifyListeners();
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> get pages => const [
        HomeView(),
        Center(child: Text('Spaces')),
        Center(child: Text('Create')),
      ];
}
