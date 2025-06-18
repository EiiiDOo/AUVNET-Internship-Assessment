import 'package:auvnet_internship_assessment/core/constants/local_storage_keys.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/startup/data/data_sources/startup_local_datasource.dart';

class StartupLocalDatasourceImpl implements StartupLocalDatasource {
  final LocalStorage localStorage;

  StartupLocalDatasourceImpl(this.localStorage);

  @override
  Future<bool> isFirstTime() async {
    return await localStorage.get(LocalStorageKeys.firstTime.name) ?? true;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    final user = await localStorage.get(LocalStorageKeys.user.name);
    return user != null ? true : false;
  }
}
