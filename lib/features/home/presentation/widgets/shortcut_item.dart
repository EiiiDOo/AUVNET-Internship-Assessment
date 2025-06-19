import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/shortcuts_entity.dart';

class ShortcutItem extends StatelessWidget {
  final ShortcutsEntity shortcut;

  const ShortcutItem({super.key, required this.shortcut});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildImageContainer(context)),
        Expanded(child: _buildTitle()),
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
        color: const Color(0xFFFFEEE6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: NetworkImageWidget(
        imageUrl: shortcut.imgUrl,
        height: 70,
        width: 85,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(shortcut.name, style: AppTextStyles.homeNameMedium);
  }
}
