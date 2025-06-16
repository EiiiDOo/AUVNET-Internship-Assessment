import 'package:auvnet_internship_assessment/features/startup/data/datasources/startup_local_datasource.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/entities/startup_status.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/repositories/startup_repository.dart';

class StartupRepositoryImpl implements StartupRepository {
  final StartupLocalDatasource local;

  StartupRepositoryImpl(this.local);

  @override
  Future<StartupStatus> getStartupStatus() async {
    final firstTime = await local.isFirstTime();
    if (firstTime) return StartupStatus.firstTime;

    final loggedIn = await local.isUserLoggedIn();
    if (loggedIn) return StartupStatus.loggedIn;

    return StartupStatus.notLoggedIn;
  }
}
