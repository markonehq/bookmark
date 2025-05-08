// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_nav_view.dart';

class BottomNavActiveIcon extends ViewModelWidget<BottomNavViewModel> {
  final IconData icon;
  final String text;
  const BottomNavActiveIcon({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context, BottomNavViewModel viewModel) {
    return Container(
      height: kBottomNavigationBarHeight,
      margin: EdgeInsets.symmetric(horizontal: 0.sp),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3.sp,
            decoration: BoxDecoration(
              color: context.colorScheme.bottomNavActive,
            ),
          ),
          const Spacer(),
          Icon(
            icon,
            color: context.colorScheme.bottomNavActive,
          ),
          SizedBox(height: 2.sp),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: context.colorScheme.bottomNavActive,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.sp),
        ],
      ),
    );
  }
}

class CustomNav extends ViewModelWidget<BottomNavViewModel> {
  const CustomNav({super.key});

  @override
  Widget build(BuildContext context, BottomNavViewModel viewModel) {
    return Positioned(
      bottom: 16.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65.h,
            width: 160.w,
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(220), // Semi-transparent white
              borderRadius: BorderRadius.circular(26.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(30),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  context: context,
                  icon: Icons.grid_view_rounded,
                  text: 'Home',
                  index: 0,
                  viewModel: viewModel,
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.group,
                  text: 'Spaces',
                  index: 1,
                  viewModel: viewModel,
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          Container(
            height: 65.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(220),
              borderRadius: BorderRadius.circular(26.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(30),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: _buildNavItem(
                context: context,
                icon: Icons.add_circle,
                text: 'Create',
                index: 2,
                viewModel: viewModel,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required int index,
    required BottomNavViewModel viewModel,
  }) {
    bool isSelected = viewModel.currentIndex == index;
    return GestureDetector(
      onTap: () => viewModel.setIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          Text(
            text,
            style: context.textTheme.labelSmall?.copyWith(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
