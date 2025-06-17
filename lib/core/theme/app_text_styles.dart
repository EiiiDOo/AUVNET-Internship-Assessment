import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.titleText,
  );

  static const TextStyle description = TextStyle(
    fontSize: 14,
    color: AppColors.descText,
  );

  static const TextStyle authBtn = TextStyle(
    fontSize: 18,
    color: AppColors.background,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    color: AppColors.link,
    fontWeight: FontWeight.bold,
  );
}
