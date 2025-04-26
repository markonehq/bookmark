import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/views/chat/chat_view.dart';
import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/utils/file_exporter.dart';

part 'bottom_nav_components.dart';
part 'bottom_nav_view_model.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => BottomNavViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                toolbarHeight: 40.h,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: GestureDetector(
                    onTap: () {
                      viewModel.showCustomBottomSheet();
                    },
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://imgs.search.brave.com/nDr89etkh9EIRa6XoIrs7H-H85JZ16PHYa01Sdnftws/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWd2/My5mb3Rvci5jb20v/aW1hZ2VzL2dhbGxl/cnkvZ2VuZXJhdGUt/YS1yZWFsaXN0aWMt/YWktYXZhdGFyLW9m/LWEtZmFzaGlvbi1t/YW4taW4tZm90b3Iu/anBn",
                      ), // Use NetworkImage for the avatar
                    ),
                  ),
                ),
              ),
              body: viewModel.getViewForIndex(viewModel.currentIndex),
              // bottomNavigationBar: Container(
              //   height: 90.h,
              //   decoration: BoxDecoration(
              //     color: context.colorScheme.scaffoldColor,
              //     border: Border(
              //       top: BorderSide(
              //         color: context.colorScheme.grey.withOpacity(0.2),
              //         width: 1.0,
              //       ),
              //     ),
              //   ),
              //   // width: double.infinity,
              //   // child: Row(
              //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   //   children: [
              //   //     navButton(
              //   //       context: context,
              //   //       viewModel: viewModel,
              //   //       index: 0,
              //   //       label: 'Home',
              //   //       icon: viewModel.currentIndex == 0
              //   //           ? Icons.home
              //   //           : Icons.home_outlined,
              //   //     ),
              //   //     navButton(
              //   //       context: context,
              //   //       viewModel: viewModel,
              //   //       index: 1,
              //   //       label: 'Chat',
              //   //       icon: viewModel.currentIndex == 1
              //   //           ? Icons.star
              //   //           : Icons.star_outline,
              //   //     ),
              //   //   ],
              //   // ),
              // )
            ));
  }
}
