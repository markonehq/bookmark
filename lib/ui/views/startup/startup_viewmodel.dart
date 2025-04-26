part of 'startup_view.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger("StartupViewModel");
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 4));
    _navigationService.replaceWithTransition(
      const OnboardingView(),
      transitionStyle: Transition.zoom,
      duration: const Duration(milliseconds: 400),
    );
  }
}
