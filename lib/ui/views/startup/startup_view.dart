import 'package:flutter/material.dart';
import 'package:bookmark/app/app.locator.dart';
import 'package:bookmark/app/app.logger.dart';
import 'package:bookmark/ui/views/onboarding/onboarding_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

part 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      viewModelBuilder: () => StartupViewModel(),
      onViewModelReady: (model) => model.runStartupLogic(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bookmark',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading ...', style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 6,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
