import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'network_image_widget.dart';

class AdvertisingCard extends StatelessWidget {
  final AdvertisingEntity advertisement;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const AdvertisingCard({
    super.key,
    required this.advertisement,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          child: NetworkImageWidget(
            imageUrl: advertisement.imgUrl,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
