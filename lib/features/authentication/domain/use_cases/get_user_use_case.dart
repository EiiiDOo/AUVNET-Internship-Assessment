import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/repositories/auth_repository.dart';

class GetUserUseCase {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  Future<UserEntity?> call() => repository.getUser();
}
