import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_event.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/home_screeen.dart';

import 'package:auvnet_internship_assessment/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => getIt<HomeBloc>()..add(LoadHomeData()),
      child: HomeScreen(),
    );
  }
}
