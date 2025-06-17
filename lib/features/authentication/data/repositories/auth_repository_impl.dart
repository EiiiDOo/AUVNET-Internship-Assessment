import 'package:auvnet_internship_assessment/core/constants/storage_keys.dart';
import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:auvnet_internship_assessment/core/network/network._info.dart';
import 'package:auvnet_internship_assessment/core/storage/local_storage.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/datasources/auth_remote_data_source.dart';
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
        localStorage.put(StorageKeys.user.name, user.toJson());
      }

      return user?.toEntity();
    }
    throw NetworkFailure();
  }

  @override
  Future<bool> isSignedIn() async {
    final data = localStorage.get(StorageKeys.user.name);
    if (data != null && data is Map<String, dynamic>) {
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
        localStorage.put(StorageKeys.user.name, user.toJson());
      }
      return user?.toEntity();
    }
    throw NetworkFailure();
  }

  @override
  Future<void> signOut() async {
    if (await networkInfo.isConnected()) {
      await remoteDataSource.signOut();
    } else {
      throw NetworkFailure();
    }
  }

  @override
  Future<UserEntity?> signUpWithEmail(String email, String password) async {
    if (await networkInfo.isConnected()) {
      final user = await remoteDataSource.signUpWithEmail(email, password);
      return user?.toEntity();
    }
    throw NetworkFailure();
  }
}
