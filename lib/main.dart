import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yourappname/app/app.bottomsheets.dart';
import 'package:yourappname/app/app.dialogs.dart';
import 'package:yourappname/app/app.locator.dart';
import 'package:yourappname/app/app.router.dart';
import 'package:yourappname/services/theme_service.dart';
import 'package:yourappname/ui/common/app_colors.dart';
import 'package:yourappname/utils/extension.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final themeService = locator<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeService.brightnessListenable,
      builder: (BuildContext context, bool value, Widget? child) {
        return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: false,
          designSize: const Size(375, 812),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Your App Name',
              theme: ThemeData(
                scaffoldBackgroundColor: context.colorScheme.backgroundLight,
                brightness: Brightness.light,
                fontFamily: "Gilroy",
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: context.colorScheme.backgroundDark,
                brightness: Brightness.dark,
                fontFamily: "Gilroy",
              ),
              themeMode: value ? ThemeMode.dark : ThemeMode.light,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              initialRoute: Routes.startupView,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
            );
          },
        );
      },
    );
  }
}
