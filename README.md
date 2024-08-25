# Base Template
This is a base template for a Flutter project. It includes a basic project structure, a theme, and a few widgets that are commonly used in Flutter projects.

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install the dependencies
3. Run `flutter run` to start the app
4. If you want to change the app name, run `flutter pub run change_app_package_name:main com.new.app.name` or `flutter pub run change_app_package_name:main com.new.app.name --bundleId com.new.app.name` for iOS
5. Manually change the app name in `ios/Runner/Info.plist` and `android/app/src/main/AndroidManifest.xml` => use VSCODE search and replace all to change the app name

## Features
- [x] Basic project structure
- [x] Theme setup (Can directly use colors & switch between light and dark theme)
- [x] Font setup (Can directly use fonts)
- [x] Change app font (Basic fonts structure)
- [x] Change app color (Basic colors structure)
- [x] Commonly used widgets (Like dialogs and bottom sheets)
- [X] Can delete platform specific code (iOS/Android/MacOS/Web/Windows) if not needed