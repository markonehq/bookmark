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
        return Scaffold(
          body: model.getViewForCurrentIndex(model.currentIndex),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  backgroundColor: context.colorScheme.card,
                  elevation: 0,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                  selectedItemColor: context.colorScheme.primary,
                  unselectedItemColor: context.colorScheme.bottomNavInactive,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: const TextStyle(fontSize: 0),
                  currentIndex: model.currentIndex,
                  onTap: model.setIndex,
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: context.colorScheme.primary,
                      label: '',
                      icon: const Icon(Icons.grid_on),
                      activeIcon: const BottomNavActiveIcon(
                        icon: Icons.grid_on_outlined,
                        text: "Home",
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: '',
                      icon: Icon(Icons.group_rounded),
                      activeIcon: BottomNavActiveIcon(
                        icon: Icons.group_outlined,
                        text: "Spaces",
                      ),
                    ),
                    const BottomNavigationBarItem(
                      label: '',
                      icon: Icon(Icons.add),
                      activeIcon: BottomNavActiveIcon(
                        icon: Icons.add_outlined,
                        text: "Create",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
