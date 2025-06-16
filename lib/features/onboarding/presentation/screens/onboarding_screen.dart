import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:auvnet_internship_assessment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final onboardingPages = ['Welcome', 'Track your goals', 'Stay focused'];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingBloc>(),
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingDone) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) => Center(
                    child: Text(
                      onboardingPages[index],
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    ),
                    child: const Text("Skip"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == onboardingPages.length - 1) {
                        context.read<OnboardingBloc>().add(
                          OnboardingCompleted(),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == onboardingPages.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
