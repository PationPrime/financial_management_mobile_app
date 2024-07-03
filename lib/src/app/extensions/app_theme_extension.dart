library src.app.theme.extension;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

extension AppThemeExtension on BuildContext {
  AppThemeTextStyles get text =>
      Theme.of(this).extension<AppThemeTextStyles>()!;

  AppThemeColors get color => Theme.of(this).extension<AppThemeColors>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
