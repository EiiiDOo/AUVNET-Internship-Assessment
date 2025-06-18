import 'package:auvnet_internship_assessment/core/constants/user_keys.dart';
import 'package:auvnet_internship_assessment/core/error/error_parse.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/auth_use_cases.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_event.dart';
import 'package:auvnet_internship_assessment/features/authentication/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases authUseCases;

  AuthBloc({required this.authUseCases}) : super(AuthInitialState()) {
    on<SignInRequestedEvent>(_onSignInRequested);
    on<SignUpRequestedEvent>(_onSignUpRequested);
    on<SignOutRequestedEvent>(_onSignOutRequested);
    on<CheckSignedInStatusEvent>(_onCheckSignedInStatus);
  }

  Future<void> _onSignInRequested(
    SignInRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    try {
      final user = await authUseCases.signInWithEmail(
        event.email,
        event.password,
      );
      if (user != null) {
        emit(AuthSuccessState(user));
      } else {
        emit(AuthFailureState(UserErrorKeys.invalidCredentials));
      }
    } catch (e) {
      emit(AuthFailureState(e.errorMessage));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    try {
      final user = await authUseCases.signUpWithEmail(
        event.email,
        event.password,
      );
      if (user != null) {
        emit(AuthSuccessState(user));
      } else {
        emit(AuthFailureState(UserErrorKeys.couldNotRegisterUser));
      }
    } catch (e) {
      emit(AuthFailureState(e.errorMessage));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    try {
      await authUseCases.signOut();
      emit(AuthSignedOutState());
    } catch (e) {
      emit(AuthFailureState(e.errorMessage));
    }
  }

  Future<void> _onCheckSignedInStatus(
    CheckSignedInStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());

    try {
      final isSignedIn = await authUseCases.isSignedIn();
      if (isSignedIn) {
        final user = await authUseCases.getUser();
        if (user != null) {
          emit(AuthSuccessState(user));
        } else {
          emit(AuthFailureState(UserErrorKeys.userNotFound));
        }
      } else {
        emit(AuthSignedOutState());
      }
    } catch (e) {
      emit(AuthFailureState(e.errorMessage));
    }
  }
}
