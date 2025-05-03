import 'package:bookmark/utils/file_exporter.dart';

Widget loadingCircular() {
  return const Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Loading ...', style: TextStyle(fontSize: 16)),
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 6,
          ),
        )
      ],
    ),
  );
}
