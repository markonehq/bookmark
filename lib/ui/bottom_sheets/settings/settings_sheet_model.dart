part of 'settings_sheet.dart';

class SettingsSheetModel extends BaseViewModel {
  final log = getLogger("SettingsSheetModel");

  bool isDarkMode = false;

  void toggleMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void init() {
    // Initialize any data or state here
  }
}
