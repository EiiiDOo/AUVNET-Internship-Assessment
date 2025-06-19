import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final Function(int)? onTap;
  final Color? activeColor;
  final Color? inactiveColor;
  final double size;
  final double spacing;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    this.onTap,
    this.activeColor,
    this.inactiveColor,
    this.size = 8.0,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCount, (index) => _buildIndicator(index)),
    );
  }

  Widget _buildIndicator(int index) {
    final isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap?.call(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: spacing / 2),
        height: size,
        width: isActive ? size * 2 : size,
        decoration: BoxDecoration(
          color: isActive
              ? (activeColor ?? AppColors.primary)
              : (inactiveColor ?? Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(size / 2),
        ),
      ),
    );
  }
}
