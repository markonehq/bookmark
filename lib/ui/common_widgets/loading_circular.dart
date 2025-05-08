import 'package:bookmark/utils/file_exporter.dart';

Widget loadingCircular() {
  return Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Loading ...', style: TextStyle(fontSize: 16)),
        SizedBox(
          width: 16.w,
          height: 16.h,
          child: const CircularProgressIndicator(
            color: Color(0xFF242424),
            strokeWidth: 6,
          ),
        )
      ],
    ),
  );
}
