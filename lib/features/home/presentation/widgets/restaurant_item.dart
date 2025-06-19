import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/popular_restaurant_nearby_entity.dart';

class RestaurantItem extends StatelessWidget {
  final PopularRestaurantNearbyEntity restaurant;

  const RestaurantItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildImageContainer(context)),
        Expanded(child: _buildInfoSection()),
      ],
    );
  }

  Widget _buildImageContainer(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.25,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.titleText.withAlpha(50)),
      ),
      child: NetworkImageWidget(
        imageUrl: restaurant.imgUrl,
        height: 70,
        width: 85,
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          restaurant.name,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.homeNameMedium,
        ),
        Row(
          spacing: 4,
          children: [
            Icon(Icons.access_time_outlined, size: 14),
            Text(restaurant.time, style: AppTextStyles.homeSmall),
          ],
        ),
      ],
    );
  }
}
