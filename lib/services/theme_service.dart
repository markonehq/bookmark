import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bookmark/app/app.locator.dart';
import 'package:bookmark/services/local_storage_service.dart';

@lazySingleton
class ThemeService {
  static const String _key = 'isDark';
  static final _localStorageService = locator<LocalStorageService>();

  final ValueNotifier<bool> brightnessListenable =
      ValueNotifier<bool>(_localStorageService.read<bool>(_key) ?? false);

  Brightness get brightness =>
      brightnessListenable.value ? Brightness.dark : Brightness.light;

  void updateTheme() {
    brightnessListenable.value = !brightnessListenable.value;
    _localStorageService.write(_key, brightnessListenable.value);
  }
}
