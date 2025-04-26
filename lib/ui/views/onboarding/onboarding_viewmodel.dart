part of 'onboarding_view.dart';

class OnboardingViewModel extends BaseViewModel {
  final log = getLogger("OnboardingViewModel");
  final NavigationService navigationService = locator<NavigationService>();
  void init() {
    Future.delayed(const Duration(seconds: 1), () {
      navigationService.clearStackAndShow(Routes.homeView);
    });
  }
}
