import 'package:bookmark/services/auth_service.dart';
import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/assets_constants.dart';
import 'package:bookmark/utils/file_exporter.dart';

part 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      viewModelBuilder: () => StartupViewModel(),
      onViewModelReady: (model) => model.runStartupLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: context.colorScheme.scaffoldColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12).w,
                child: Image.asset(
                  AssetsConstants.logo,
                  width: 100.w,
                  height: 100.h,
                  cacheWidth: 100,
                  cacheHeight: 100,
                  fit: BoxFit.cover,
                ),
              ),
              12.verticalSpace,
              Text(
                'Bookmark',
                style: model.font.h2(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Loading  ',
                    style: model.font.b2(),
                  ),
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
