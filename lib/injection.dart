import 'package:auvnet_internship_assessment/core/constants/hive_keys.dart';
import 'package:auvnet_internship_assessment/core/network/network._info.dart';
import 'package:auvnet_internship_assessment/core/network/network_info_impl.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/services/remote_cloud_services.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/services/supabase_auth_services_impl.dart';
import 'package:auvnet_internship_assessment/core/storage/hive_storage.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/auth_use_cases.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_internship_assessment/features/onboarding/data/data_sources/onboarding_local_datasource.dart';
import 'package:auvnet_internship_assessment/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:auvnet_internship_assessment/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:auvnet_internship_assessment/features/onboarding/domain/use_cases/mark_onboarding_seen.dart';
import 'package:auvnet_internship_assessment/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:auvnet_internship_assessment/features/startup/data/data_sources/startup_local_datasource.dart';
import 'package:auvnet_internship_assessment/features/startup/data/data_sources/startup_local_datasource_impl.dart';
import 'package:auvnet_internship_assessment/features/startup/data/repositories/startup_repository_impl.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/repositories/startup_repository.dart';
import 'package:auvnet_internship_assessment/features/startup/domain/use_cases/get_startup_status.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide LocalStorage;

final GetIt getIt = GetIt.instance;
Future<void> setupInjection() async {
  // Hive
  final box = await Hive.openBox(HiveBoxes.app);
  getIt.registerLazySingleton<Box>(() => box);
  getIt.registerLazySingleton<LocalStorage>(() => HiveStorage(getIt<Box>()));

  // Connectivity plus Info
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Network Info
  getIt.registerLazySingleton<NetworkInfo>(
    () => ConnectivityPlusNetworkInfoImpl(getIt<Connectivity>()),
  );

  // Supabase Client
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Remote Cloud Service
  getIt.registerLazySingleton<RemoteCloudServices>(
    () => SupabaseAuthServiceImpl(client: getIt()),
  );

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
    () => GetStartupStatus(getIt<StartupRepository>()),
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
  getIt.registerLazySingleton<MarkOnboardingSeen>(
    () => MarkOnboardingSeen(getIt<OnboardingRepository>()),
  );

  // Bloc
  getIt.registerFactory(() => OnboardingBloc(getIt<MarkOnboardingSeen>()));

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // Auth

  // data
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<RemoteCloudServices>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
      localStorage: getIt<LocalStorage>(),
    ),
  );

  //domain
  getIt.registerLazySingleton<AuthUseCases>(
    () => AuthUseCases(
      signInWithEmail: SignInWithEmailUseCase(getIt<AuthRepository>()),
      signUpWithEmail: SignUpWithEmailUseCase(getIt<AuthRepository>()),
      signOut: SignOutUseCase(getIt<AuthRepository>()),
      isSignedIn: IsSignedInUseCase(getIt<AuthRepository>()),
      getUser: GetUserUseCase(getIt<AuthRepository>()),
    ),
  );

  // bloc
  getIt.registerFactory(() => AuthBloc(authUseCases: getIt<AuthUseCases>()));
}
