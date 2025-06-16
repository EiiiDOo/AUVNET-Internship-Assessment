import 'package:auvnet_internship_assessment/core/constants/storage_keys.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/startup/data/datasources/startup_local_datasource.dart';

class StartupLocalDatasourceImpl implements StartupLocalDatasource {
  final LocalStorage localStorage;

  StartupLocalDatasourceImpl(this.localStorage);

  @override
  Future<bool> isFirstTime() async {
    return await localStorage.readBool(StorageKeys.firstTime) ?? true;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await localStorage.readBool(StorageKeys.loggedIn) ?? false;
  }
}
