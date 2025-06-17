import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/core/widgets/custom_elevation_button.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/utils/validators.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/widgets/custom_text_input_field.dart';
import 'package:auvnet_internship_assessment/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('validates')));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                            Navigator.pushNamed(context, AppRoutes.signUp);
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
    );
  }
}
