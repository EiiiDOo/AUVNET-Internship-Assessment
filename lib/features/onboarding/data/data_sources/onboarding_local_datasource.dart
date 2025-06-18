import 'package:auvnet_internship_assessment/core/constants/local_storage_keys.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';

abstract class OnboardingLocalDatasource {
  Future<void> markOnboardingSeen();
}

class OnboardingLocalDatasourceImpl implements OnboardingLocalDatasource {
  final LocalStorage localStorage;

  OnboardingLocalDatasourceImpl(this.localStorage);

  @override
  Future<void> markOnboardingSeen() async {
    await localStorage.put(LocalStorageKeys.firstTime.name, false);
  }
}
