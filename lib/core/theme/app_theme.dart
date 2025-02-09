import 'package:flutter/material.dart';
import '/core/theme/app_colors.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
  );
}
