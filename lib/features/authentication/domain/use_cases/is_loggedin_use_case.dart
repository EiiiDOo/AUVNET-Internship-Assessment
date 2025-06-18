import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';

class IsSignedInUseCase {
  final AuthRepository repository;

  IsSignedInUseCase(this.repository);

  Future<bool> call() => repository.isSignedIn();
}
