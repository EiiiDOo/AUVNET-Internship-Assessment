import 'package:auvnet_internship_assessment/features/authentication/data/services/remote_cloud_services.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signInWithEmail(String email, String password);
  Future<UserModel?> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<UserModel?> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final RemoteCloudAuthServices authServices;

  AuthRemoteDataSourceImpl(this.authServices);

  @override
  Future<UserModel?> getUser() {
    return authServices.getUser();
  }

  @override
  Future<UserModel?> signInWithEmail(String email, String password) {
    return authServices.signInWithEmail(email, password);
  }

  @override
  Future<void> signOut() {
    return authServices.signOut();
  }

  @override
  Future<UserModel?> signUpWithEmail(String email, String password) {
    return authServices.signUpWithEmail(email, password);
  }
}
