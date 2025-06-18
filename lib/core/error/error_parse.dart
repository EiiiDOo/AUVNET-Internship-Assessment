import 'package:auvnet_internship_assessment/core/error/exceptions.dart';

extension ErrorMessageExtension on Object {
  String get errorMessage {
    if (this is Failure) {
      return (this as Failure).message;
    }

    if (this is FormatException) {
      return 'Bad response format.';
    }

    return 'Unexpected error occurred.';
  }
}
