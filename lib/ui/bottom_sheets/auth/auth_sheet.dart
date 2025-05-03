import 'package:bookmark/services/auth_service.dart';
import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/ui/common/app_font.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
                  height: 400.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.scaffoldColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Text("data")),
            ));
  }

  @override
  AuthSheetModel viewModelBuilder(BuildContext context) => AuthSheetModel();
}
