import 'package:bookmark/utils/file_exporter.dart';

part 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.nonReactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Text(
            'Onboarding Screen',
          ),
        ),
      ),
    );
  }
}
