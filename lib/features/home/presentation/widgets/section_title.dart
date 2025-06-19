import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(title, style: AppTextStyles.homeSideTitle),
    );
  }
}
