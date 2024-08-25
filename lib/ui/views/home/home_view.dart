import 'package:yourappname/ui/common/ui_helpers.dart';
import 'package:yourappname/utils/file_exporter.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.incrementCounter(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  verticalSpaceLarge,
                  Column(
                    children: [
                      Text(
                        'Home Screen!',
                        style: context.font.title(
                          context,
                          color: context.colorScheme.text,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      verticalSpaceMedium,
                      MaterialButton(
                        color: context.colorScheme.card,
                        onPressed: model.incrementCounter,
                        child: Text(
                          model.counterLabel,
                          style: TextStyle(
                            color: context.colorScheme.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        color: context.colorScheme.card,
                        onPressed: model.showDialog,
                        child: Text(
                          'Show Dialog',
                          style: TextStyle(
                            color: context.colorScheme.text,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: context.colorScheme.card,
                        onPressed: model.showBottomSheet,
                        child: Text(
                          'Show Bottom Sheet',
                          style: TextStyle(
                            color: context.colorScheme.text,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
