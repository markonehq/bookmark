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
        color: context.colorScheme.primary.withOpacity(0.1),
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
          // Nav Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Semi-transparent white
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildNavItem(
                  context: context,
                  icon: Icons.home,
                  text: 'Home',
                  index: 0,
                  viewModel: viewModel,
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.space_bar,
                  text: 'Spaces',
                  index: 1,
                  viewModel: viewModel,
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // Add Button (Create)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Semi-transparent white
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: _buildNavItem(
              context: context,
              icon: Icons.add,
              text: 'Create',
              index: 2,
              viewModel: viewModel,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for creating each navigation item with label
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Icon(
              icon,
              color: isSelected
                  ? Colors.black
                  : Colors.grey, // black when selected
            ),
            // Static Label
            SizedBox(height: 4.sp),
            Text(
              text,
              style: context.textTheme.bodySmall?.copyWith(
                color: isSelected ? Colors.black : Colors.grey, //
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
