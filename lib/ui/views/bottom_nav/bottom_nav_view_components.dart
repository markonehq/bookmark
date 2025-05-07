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
