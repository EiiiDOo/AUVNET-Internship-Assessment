import 'package:auvnet_internship_assessment/core/constants/hive_keys.dart';
import 'package:auvnet_internship_assessment/core/storage/hive_storage.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:auvnet_internship_assessment/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:auvnet_internship_assessment/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:auvnet_internship_assessment/features/onboarding/domain/use_cases/mark_onboarding_seen.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:auvnet_internship_assessment/features/startup/data/datasources/startup_local_datasource.dart';
import 'package:auvnet_internship_assessment/features/startup/data/datasources/startup_local_datasource_impl.dart';
import 'package:auvnet_internship_assessment/features/startup/data/repositories/startup_repository_impl.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/repositories/startup_repository.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/use_cases/get_startup_status.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupInjection() async {
  // Hive
  final box = await Hive.openBox(HiveBoxes.app);
  getIt.registerLazySingleton<Box>(() => box);
  getIt.registerLazySingleton<LocalStorage>(() => HiveStorage(getIt<Box>()));

  // startup
  // Data layer
  getIt.registerLazySingleton<StartupLocalDatasource>(
    () => StartupLocalDatasourceImpl(getIt<LocalStorage>()),
  );
  getIt.registerLazySingleton<StartupRepository>(
    () => StartupRepositoryImpl(getIt<StartupLocalDatasource>()),
  );

  // Domain
  getIt.registerLazySingleton(
    () => GetStartupStatus(getIt<StartupRepositoryImpl>()),
  );

  // Bloc
  getIt.registerFactory(() => StartupBloc(getIt<GetStartupStatus>()));

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // Onboarding
  // Data layer
  getIt.registerLazySingleton<OnboardingLocalDatasource>(
    () => OnboardingLocalDatasourceImpl(getIt<LocalStorage>()),
  );
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(getIt<OnboardingLocalDatasource>()),
  );

  // Domain
  getIt.registerLazySingleton(
    () => MarkOnboardingSeen(getIt<OnboardingRepository>()),
  );

  // Bloc
  getIt.registerFactory(() => OnboardingBloc(getIt<MarkOnboardingSeen>()));
}
