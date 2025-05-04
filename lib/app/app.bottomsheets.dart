// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/auth/auth_sheet.dart';
import '../ui/bottom_sheets/search/search_sheet.dart';
import '../ui/bottom_sheets/settings/settings_sheet.dart';

enum BottomSheetType {
  settings,
  search,
  auth,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.settings: (context, request, completer) =>
        SettingsSheet(request: request, completer: completer),
    BottomSheetType.search: (context, request, completer) =>
        SearchSheet(request: request, completer: completer),
    BottomSheetType.auth: (context, request, completer) =>
        AuthSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
