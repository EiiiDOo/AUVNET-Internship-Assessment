import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/services_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_state.dart';
import 'loading_widget.dart';
import 'section_title.dart';
import 'service_item.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<ServicesEntity>>(
      selector: (state) => state is HomeLoaded ? state.services : [],
      builder: (context, services) {
        if (services.isEmpty) {
          return const LoadingWidget();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Services:"),
            SizedBox(
              height: context.screenHeight * 0.22,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                itemBuilder: (context, index) =>
                    ServiceItem(service: services[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
