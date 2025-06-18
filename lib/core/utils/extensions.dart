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
