import 'package:auvnet_internship_assessment/features/authentication/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntity? user;
  AuthSuccessState(this.user);
}

class AuthFailureState extends AuthState {
  final String message;
  AuthFailureState(this.message);
}

class AuthSignedOutState extends AuthState {}
