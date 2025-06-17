import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';

class AuthUseCases {
  final SignInWithEmailUseCase signInWithEmail;
  final SignUpWithEmailUseCase signUpWithEmail;
  final SignOutUseCase signOut;
  final IsSignedInUseCase isSignedIn;
  final GetUserUseCase getUser;

  AuthUseCases({
    required this.signInWithEmail,
    required this.signUpWithEmail,
    required this.signOut,
    required this.isSignedIn,
    required this.getUser,
  });
}

class SignInWithEmailUseCase {
  final AuthRepository repository;

  SignInWithEmailUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}

class SignUpWithEmailUseCase {
  final AuthRepository repository;

  SignUpWithEmailUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signUpWithEmail(email, password);
  }
}

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() => repository.signOut();
}

class IsSignedInUseCase {
  final AuthRepository repository;

  IsSignedInUseCase(this.repository);

  Future<bool> call() => repository.isSignedIn();
}

class GetUserUseCase {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  Future<UserEntity?> call() => repository.getUser();
}
