import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signInWithEmail(String email, String password);
  Future<UserEntity?> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<UserEntity?> getUser();
}
