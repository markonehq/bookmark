import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:bookmark/utils/screen_wrapper.dart';

part 'chat_viewmodel.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final font = FontTheme();
    return ViewModelBuilder<ChatViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => ChatViewModel(),
      builder: (context, model, child) => Scaffold(
        body: ScreenWrapper(
            child: Center(
          child: Text(
            "Chat View",
            style: font.body(),
          ),
        )),
      ),
    );
  }
}
