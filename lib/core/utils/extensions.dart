import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  double get heightWithoutPaddingTopAndBottom =>
      screenHeight - statusBarHeight - bottomBarHeight;

  ThemeData get theme => Theme.of(this);
}

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
