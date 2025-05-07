import 'package:bookmark/services/auth_service.dart';
import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/ui/common_widgets/loading_circular.dart';
import 'package:bookmark/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:bookmark/ui/views/home/home_view.dart';
import 'package:bookmark/utils/assets_constants.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_animate/flutter_animate.dart';

part 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
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
              loadingCircular(),
            ],
          ),
        ),
      ),
    );
  }
}
