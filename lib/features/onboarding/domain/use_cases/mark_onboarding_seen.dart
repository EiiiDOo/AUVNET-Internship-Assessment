import 'package:auvnet_internship_assessment/features/onboarding/domain/repositories/onboarding_repository.dart';

class MarkOnboardingSeen {
  final OnboardingRepository onboardingRepository;

  MarkOnboardingSeen(this.onboardingRepository);

  Future<void> call() => onboardingRepository.markOnboardingSeen();
}
