import 'package:auvnet_internship_assessment/features/startup/domain/entities/startup_status.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/repositories/startup_repository.dart';

class GetStartupStatus {
  final StartupRepository repository;

  GetStartupStatus(this.repository);

  Future<StartupStatus> call() {
    return repository.getStartupStatus();
  }
}
