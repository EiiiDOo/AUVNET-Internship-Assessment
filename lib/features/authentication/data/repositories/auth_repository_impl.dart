import 'package:auvnet_internship_assessment/core/constants/local_storage_keys.dart';
import 'package:auvnet_internship_assessment/core/constants/user_keys.dart';
import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:auvnet_internship_assessment/core/network/network._info.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalStorage localStorage;

  AuthRepositoryImpl({
    required this.localStorage,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<UserEntity?> getUser() async {
    if (await networkInfo.isConnected()) {
      final user = await remoteDataSource.getUser();

      if (user != null) {
        localStorage.put(LocalStorageKeys.user.name, user.toJson());
      }

      return user?.toEntity();
    }
    throw NetworkFailure('No internet connection');
  }

  @override
  Future<bool> isSignedIn() async {
    final data = await localStorage.get(LocalStorageKeys.user.name);
    if (data != null && data is Map && data.containsKey(UserKeys.email.name)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserEntity?> signInWithEmail(String email, String password) async {
    if (await networkInfo.isConnected()) {
      final user = await remoteDataSource.signInWithEmail(email, password);
      if (user != null) {
        localStorage.put(LocalStorageKeys.user.name, user.toJson());
      }
      return user?.toEntity();
    }
    throw NetworkFailure('No internet connection');
  }

  @override
  Future<void> signOut() async {
    if (await networkInfo.isConnected()) {
      await remoteDataSource.signOut();
      await localStorage.delete(LocalStorageKeys.user);
    } else {
      throw NetworkFailure('No internet connection');
    }
  }

  @override
  Future<UserEntity?> signUpWithEmail(String email, String password) async {
    if (await networkInfo.isConnected()) {
      final user = await remoteDataSource.signUpWithEmail(email, password);
      return user?.toEntity();
    }
    throw NetworkFailure('No internet connection');
  }
}
