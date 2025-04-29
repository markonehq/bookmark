import 'package:bookmark/utils/file_exporter.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;

  const ScreenWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: child,
      ),
    );
  }
}
