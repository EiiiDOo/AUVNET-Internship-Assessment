import 'package:auvnet_internship_assessment/features/authentication/data/models/user_model.dart';

abstract class RemoteCloudServices {
  Future<UserModel?> signInWithEmail(String email, String password);
  Future<UserModel?> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<UserModel?> getUser();
}
