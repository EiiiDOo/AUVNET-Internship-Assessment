import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/is_loggedin_use_case.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/sign_out_use_case.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/sign_up_with_email_use_case.dart';
import 'package:auvnet_internship_assessment/features/authentication/domain/use_cases/signin_with_email_use_case.dart';

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
