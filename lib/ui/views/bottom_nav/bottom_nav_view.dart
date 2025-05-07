import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/utils/file_exporter.dart';
part 'bottom_nav_view_model.dart';
part 'bottom_nav_view_components.dart';

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
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF7F4E8), Color(0xFFEFF0F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: PageView(
                controller: model.pageController,
                onPageChanged: model.setIndex,
                children: model.pages,
              ),
            ),
            // Custom Nav Bar Here (as shown above)
            const CustomNav(),
          ],
        );
      },
    );
  }
}
