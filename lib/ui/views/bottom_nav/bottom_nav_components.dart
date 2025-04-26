part of 'bottom_nav_view.dart';

Widget navButton({
  required BuildContext context,
  required BottomNavViewModel viewModel,
  required int index,
  required String label,
  required IconData icon,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (viewModel.currentIndex == index) {
          return;
        }
        viewModel.setNavIndex(index);
      },
      child: Container(
          color: Colors.transparent,
          height: 65.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24.sp,
              ),
              6.verticalSpace,
              // AppText(
              //   label,
              //   context,
              //   color: viewModel.currentIndex == index
              //       ? context.colorScheme.bottomNavActive
              //       : context.colorScheme.bottomNavInactive,
              // ).body3,
              // 8.verticalSpace,
            ],
          )),
    ),
  );
}
