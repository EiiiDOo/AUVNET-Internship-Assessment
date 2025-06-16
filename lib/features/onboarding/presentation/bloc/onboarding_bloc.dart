import 'package:auvnet_internship_assessment/features/onboarding/domain/use_cases/mark_onboarding_seen.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final MarkOnboardingSeen markOnboardingSeen;

  OnboardingBloc(this.markOnboardingSeen) : super(OnboardingInitial()) {
    on<OnboardingCompleted>((event, emit) async {
      markOnboardingSeen();
      emit(OnboardingDone());
    });
  }
}
