import 'package:auvnet_internship_assessment/features/authentication/presentation/screens/sign_in.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/screens/sign_up.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/home_page.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/screens/startup_screen.dart';
import 'package:auvnet_internship_assessment/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startup:
        return MaterialPageRoute(builder: (_) => const StartupScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
