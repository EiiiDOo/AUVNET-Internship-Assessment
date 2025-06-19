import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/popular_restaurant_nearby_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_state.dart';
import 'loading_widget.dart';
import 'section_title.dart';
import 'restaurant_item.dart';

class NearbyRestaurantsSection extends StatelessWidget {
  const NearbyRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      HomeBloc,
      HomeState,
      List<PopularRestaurantNearbyEntity>
    >(
      selector: (state) => state is HomeLoaded ? state.nearbyRestaurants : [],
      builder: (context, restaurants) {
        if (restaurants.isEmpty) {
          return const LoadingWidget();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Popular restaurants nearby:"),
            SizedBox(
              height: context.screenHeight * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                itemBuilder: (context, index) =>
                    RestaurantItem(restaurant: restaurants[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
