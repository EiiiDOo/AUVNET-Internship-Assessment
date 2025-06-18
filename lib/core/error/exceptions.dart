abstract class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class AuthFailure extends Failure {
  AuthFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure() : super("Unexpected error occurred.");
}

class HiveFailure extends Failure {
  HiveFailure(super.message);
}

class DotEnvFailure extends Failure {
  DotEnvFailure(super.message);
}

class GetItFailure extends Failure {
  GetItFailure(super.message);
}

class DataFailure extends Failure {
  DataFailure(super.message);
}
