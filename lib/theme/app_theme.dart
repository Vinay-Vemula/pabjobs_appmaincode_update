import 'package:flutter/material.dart';
import 'package:pabjobs/theme/color_theme.dart';

enum AppTheme {
  PABLight,
}

final appThemeData = {
  AppTheme.PABLight: ThemeData(
      fontFamily: 'PlusJakartaSans',
      primaryColor: PABColorTheme.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
          primary: PABColorTheme.primaryColor,
          secondary: PABColorTheme.primaryColor.withOpacity(0.9))),
};
