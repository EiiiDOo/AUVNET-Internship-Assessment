import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/services_entity.dart';
import 'network_image_widget.dart';

class ServiceItem extends StatelessWidget {
  final ServicesEntity service;

  const ServiceItem({super.key, required this.service});

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
      width: context.screenWidth / 3,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: NetworkImageWidget(
        imageUrl: service.imgUrl,
        height: 70,
        width: 85,
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(children: [_buildMoreText(), _buildServiceName()]);
  }

  Widget _buildMoreText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        service.more,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildServiceName() {
    return Text(service.name, style: AppTextStyles.homeSideTitle);
  }
}
