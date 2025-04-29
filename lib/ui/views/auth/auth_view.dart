import 'package:bookmark/services/auth_service.dart' show AuthService;
import 'package:bookmark/utils/assets_constants.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_svg/svg.dart';

part 'auth_viewmodel.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: context.colorScheme.scaffoldColor,
        body: Center(
          child: SizedBox(
            width: 200.w,
            child: ElevatedButton(
                onPressed: () {
                  model.login();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsConstants.google,
                      height: 24.h,
                      width: 24.w,
                    ),
                    8.horizontalSpace,
                    const Text("Google Sign In"),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
