import 'package:auvnet_internship_assessment/features/startup/domain/entities/startup_status.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_bloc.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_event.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_state.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:auvnet_internship_assessment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StartupBloc>()..add(CheckStartupEvent()),
      child: BlocListener<StartupBloc, StartupState>(
        listener: (context, state) {
          if (state is StartupLoaded) {
            switch (state.status) {
              case StartupStatus.firstTime:
                Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
                break;
              case StartupStatus.notLoggedIn:
                Navigator.pushReplacementNamed(context, AppRoutes.login);
                break;
              case StartupStatus.loggedIn:
                Navigator.pushReplacementNamed(context, AppRoutes.home);
                break;
            }
          }
        },
        child: const Scaffold(
          body: SizedBox(
            width: 50,
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
