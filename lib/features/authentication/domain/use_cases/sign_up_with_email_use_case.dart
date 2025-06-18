import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';

class SignUpWithEmailUseCase {
  final AuthRepository repository;

  SignUpWithEmailUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signUpWithEmail(email, password);
  }
}
