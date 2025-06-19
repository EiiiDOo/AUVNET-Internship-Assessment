import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_state.dart';
import 'loading_widget.dart';
import 'advertising_pageview.dart';

class AdvertisingSection extends StatelessWidget {
  const AdvertisingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<AdvertisingEntity>>(
      selector: (state) => (state is HomeLoaded) ? state.advertising : [],
      builder: (context, advertisements) {
        if (advertisements.isEmpty) {
          return const LoadingWidget();
        }

        return AdvertisingPageView(advertisements: advertisements);
      },
    );
  }
}
