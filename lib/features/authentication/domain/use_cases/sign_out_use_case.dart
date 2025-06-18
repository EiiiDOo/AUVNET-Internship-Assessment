import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() => repository.signOut();
}
