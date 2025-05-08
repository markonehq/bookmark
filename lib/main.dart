import 'dart:async';
import 'dart:io';

import 'package:bookmark/firebase_options.dart';
import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with proper error handling
  try {
    debugPrint('🔥 Initializing Firebase...');
    await Firebase.initializeApp(
      options: Platform.isAndroid
          ? DefaultFirebaseOptions.android
          : DefaultFirebaseOptions.ios,
    );
    debugPrint('✅ Firebase Initialized!');
  } catch (e, stack) {
    debugPrint('❌ Firebase init error: $e');
    debugPrint('Stack trace: $stack');
  }

  // Set up error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint('Flutter Error: ${details.toString()}');
    FlutterError.presentError(details);
  };

  // Initialize services
  await setupLocator();
  await Future.wait([
    locator<LocalStorageService>().initStorage(),
  ]);
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
                useMaterial3: true, // Enable Material 3
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: context.colorScheme.backgroundDark,
                brightness: Brightness.dark,
                fontFamily: "Gilroy",
                useMaterial3: true, // Enable Material 3
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
