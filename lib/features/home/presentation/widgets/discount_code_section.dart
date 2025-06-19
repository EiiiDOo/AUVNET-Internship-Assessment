import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/discount_code_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_state.dart';
import 'loading_widget.dart';

class DiscountCodeSection extends StatelessWidget {
  const DiscountCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<DiscountCodeEntity>>(
      selector: (state) => state is HomeLoaded ? state.discountCodes : [],
      builder: (context, codes) {
        if (codes.isEmpty) {
          return const LoadingWidget();
        }

        return DiscountCodeCard(discountCode: codes.first);
      },
    );
  }
}

class DiscountCodeCard extends StatelessWidget {
  final DiscountCodeEntity discountCode;

  const DiscountCodeCard({super.key, required this.discountCode});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 15,
      borderOnForeground: true,
      shadowColor: AppColors.titleText,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(discountCode.title, style: AppTextStyles.title),
          subtitle: Text(discountCode.desc, style: AppTextStyles.description),
          leading: SizedBox(
            width: 56,
            height: 56,
            child: NetworkImageWidget(
              imageUrl: discountCode.imgUrl,
              height: 56,
              width: 56,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
