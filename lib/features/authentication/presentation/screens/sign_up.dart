import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/widgets/sign_up_form.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: SignUpForm(),
    );
  }
}
