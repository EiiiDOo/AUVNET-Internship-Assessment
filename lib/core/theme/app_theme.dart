import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    textTheme: const TextTheme(
      headlineMedium: AppTextStyles.title,
      titleSmall: AppTextStyles.description,
      labelLarge: AppTextStyles.link,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        ),
      ),
    ),
  );
}
