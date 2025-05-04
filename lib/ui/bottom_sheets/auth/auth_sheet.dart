import 'package:bookmark/services/auth_service.dart';
import 'package:bookmark/ui/common_widgets/loading_circular.dart';
import 'package:bookmark/utils/assets_constants.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:flutter_svg/svg.dart';
part 'auth_sheet_model.dart';

class AuthSheet extends StackedView<AuthSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const AuthSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthSheetModel viewModel,
    Widget? child,
  ) {
    return ViewModelBuilder.nonReactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => AuthSheetModel(),
      disposeViewModel: false,
      onDispose: (model) {
        model.dispose();
      },
      builder: (context, viewModel, child) => SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 32.h,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.scaffoldColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: SizedBox(
                  width: 60.w,
                  child: const Image(
                    image: AssetImage(AssetsConstants.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              16.verticalSpace,
              Text(
                'Sign in to continue',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Please sign in to start your knowledge vault.',
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.black.withAlpha(100),
                ),
              ),
              24.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // centered shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tired of scattered links acreoss browers, devices and apps?',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    8.verticalSpace,
                    Text(
                      'with Bookmark, you can effortlessly save, search and organize everything you care about from anywhere.',
                      style: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              24.verticalSpace,

              // const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    viewModel.login();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: context.colorScheme.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsConstants.google,
                        height: 24.h,
                        width: 24.w,
                      ),
                      8.horizontalSpace,
                      Text("Sign In with Google",
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: context.colorScheme.white,
                          )),
                    ],
                  )),
              16.verticalSpace,
              Text(
                'By clicking ‘Sign In with Google’, you acknowledge that you have read and understood, and agree to Bookmark’s Terms & Conditions and Privacy Policy.',
                style: context.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.black.withAlpha(100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AuthSheetModel viewModelBuilder(BuildContext context) => AuthSheetModel();
}
