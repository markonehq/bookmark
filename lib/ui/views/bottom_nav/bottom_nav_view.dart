import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_svg/svg.dart';

part 'bottom_nav_view_components.dart';
part 'bottom_nav_view_model.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => locator<BottomNavViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Stack(
          children: [
            Scaffold(
              extendBody: true,
              backgroundColor: context.colorScheme.scaffoldColor,
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: model.pageController,
                onPageChanged: model.setIndex,
                children: model.pages,
              ),
            ),
            const CustomNav(),
          ],
        );
      },
    );
  }
}
