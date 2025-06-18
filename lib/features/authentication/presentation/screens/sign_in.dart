import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_event.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/widgets/signin_from.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>()..add(CheckSignedInStatusEvent()),
      child: SigninFrom(),
    );
  }
}
