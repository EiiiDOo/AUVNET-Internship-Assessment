import 'package:auvnet_internship_assessment/features/startup/domain/entities/startup_status.dart';

abstract class StartupRepository {
  Future<StartupStatus> getStartupStatus();
}
