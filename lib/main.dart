import 'package:bookmark/utils/file_exporter.dart';

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
              title: 'Bookmark',
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
