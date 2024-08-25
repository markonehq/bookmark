import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourappname/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

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
                'Splash Screen',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading ...', style: TextStyle(fontSize: 16)),
                  horizontalSpaceSmall,
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
