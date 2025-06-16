import 'package:auvnet_internship_assessment/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:auvnet_internship_assessment/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  final OnboardingLocalDatasource datasource;

  OnboardingRepositoryImpl(this.datasource);

  @override
  Future<void> markOnboardingSeen() {
    return datasource.markOnboardingSeen();
  }
}
