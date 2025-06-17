abstract class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class AuthFailure extends Failure {
  AuthFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("No internet connection.");
}

class UnknownFailure extends Failure {
  UnknownFailure() : super("Unexpected error occurred.");
}
