import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/features/onboarding/core/onboarding_pages.dart';
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

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (_) => getIt<OnboardingBloc>(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingDone) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODO: Handel image
                Image.asset('assets/images/background_logo.png'),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingPages.length,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    itemBuilder: (context, index) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              onboardingPages[index].onboardingStep1Title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              onboardingPages[index].onboardingStep1Description,
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height / 3,
                      decoration: BoxDecoration(
                        // TODO: Handel gradiant
                        gradient: RadialGradient(
                          center: Alignment.bottomRight,
                          radius: 1,
                          colors: [
                            const Color.fromARGB(41, 14, 190, 125),
                            AppColors.background,
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.login,
                                );
                              },

                              child: Text("Get Started"),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _currentPage == onboardingPages.length - 1
                              ? null
                              : () {
                                  if (_currentPage ==
                                      onboardingPages.length - 1) {
                                    context.read<OnboardingBloc>().add(
                                      OnboardingCompleted(),
                                    );
                                  } else {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                },
                          child: Text("Next"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
