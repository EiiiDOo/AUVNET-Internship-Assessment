import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_dialog.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_elevation_button.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_snack_bar.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_event.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_state.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/utils/validators.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/widgets/custom_text_input_field.dart';
import 'package:auvnet_internship_assessment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninFrom extends StatefulWidget {
  const SigninFrom({super.key});

  @override
  State<SigninFrom> createState() => _SigninFromState();
}

class _SigninFromState extends State<SigninFrom> {
  final GlobalKey<FormState> _formState = GlobalKey();
  TextEditingController? _email;
  TextEditingController? _pass;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  void dispose() {
    if (_email != null) _email?.dispose();
    if (_pass != null) _pass?.dispose();
    super.dispose();
  }

  signIn() async {
    if (_formState.currentState!.validate()) {
      context.read<AuthBloc>().add(
        SignInRequestedEvent(_email!.text, _pass!.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              customLoadingDialog(context);
            } else {
              Navigator.of(context, rootNavigator: true).pop();
              if (state is AuthSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                );
              } else if (state is AuthFailureState) {
                customSnackBar(
                  ctx: context,
                  content: state.message,
                  type: SnackBarType.error,
                );
              } else if (state is AuthSignedOutState) {
                // TODO: Navigate to login screen
              }
            }
          },
          child: ListView(
            children: [
              Form(
                key: _formState,
                child: SizedBox(
                  height: context.heightWithoutPaddingTopAndBottom,
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      Column(
                        spacing: 15,
                        children: [
                          customTextFormField(
                            type: TextFormType.email,
                            controller: _email,
                            width: context.screenWidth,
                            validator: FormValidators.validateEmail,
                          ),
                          customTextFormField(
                            type: TextFormType.pass,
                            controller: _pass,
                            width: context.screenWidth,
                            validator: FormValidators.validatePassword,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customElevationButton(
                            onPressed: () async {
                              await signIn();
                            },
                            width: context.screenWidth,
                            text: 'Log In',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.signUp,
                              );
                            },
                            child: Text(
                              "Create an account",
                              style: context.theme.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
