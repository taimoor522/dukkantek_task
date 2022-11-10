import 'package:dukkantek_task_taimoor/src/core/constants/colors.dart';
import 'package:dukkantek_task_taimoor/src/core/constants/font_size.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.armyGreen,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: AppFontSize.large,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.armyGreen,
        textStyle: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSize.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.armyGreen,
      foregroundColor: AppColors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.armyGreen,
    ),
  );
}
