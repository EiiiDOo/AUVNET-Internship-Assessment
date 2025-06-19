import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_dialog.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_elevation_button.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_snack_bar.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_event.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_state.dart'
    show
        AuthState,
        AuthLoadingState,
        AuthSuccessState,
        AuthFailureState,
        AuthSignedOutState;
import 'package:auvnet_internship_assessment/features/authentication/presentation/utils/validators.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/widgets/custom_text_input_field.dart';
import 'package:auvnet_internship_assessment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formState = GlobalKey();
  TextEditingController? _email;
  TextEditingController? _pass;
  TextEditingController? _confirmPass;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _pass = TextEditingController();
    _confirmPass = TextEditingController();
  }

  @override
  void dispose() {
    if (_email != null) _email?.dispose();
    if (_pass != null) _pass?.dispose();
    if (_confirmPass != null) _confirmPass?.dispose();
    super.dispose();
  }

  signUp() async {
    if (_formState.currentState!.validate()) {
      context.read<AuthBloc>().add(
        SignUpRequestedEvent(_email!.text, _pass!.text),
      );
    }
  }

  // ScaffoldMessenger.of(
  //   context,
  // ).showSnackBar(SnackBar(content: Text('validates')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            customLoadingDialog(context);
          } else {
            Navigator.of(context, rootNavigator: true).pop();
            if (state is AuthSuccessState) {
              customSnackBar(
                ctx: context,
                type: SnackBarType.success,
                content: "Please check your email",
              );
              //TODO:
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.login,
                arguments: {"isSignUpSuccessfully": true},
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
        child: Center(
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
                          customTextFormField(
                            type: TextFormType.confirmPass,
                            controller: _confirmPass,
                            width: context.screenWidth,
                            validator: (val) {
                              if (FormValidators.validatePassword(val) ==
                                  null) {
                                return _pass?.text == _confirmPass?.text
                                    ? null
                                    : 'Not match with pass';
                              } else {
                                return FormValidators.validatePassword(val);
                              }
                            },
                            textInputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          customElevationButton(
                            onPressed: () async {
                              await signUp();
                            },
                            width: context.screenWidth,
                            text: 'Sign Up',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.login,
                              );
                            },
                            child: Text(
                              "Already have an account",
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
