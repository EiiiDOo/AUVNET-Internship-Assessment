import 'package:flutter/material.dart';

enum SnackBarType {
  normal,
  error,
  success;

  Color? get color => switch (this) {
    SnackBarType.normal => null,
    SnackBarType.error => Colors.red,
    SnackBarType.success => Colors.green,
  };
}

void customSnackBar({
  required BuildContext ctx,
  SnackBarType type = SnackBarType.normal,
  Widget content = const Text('Content'),
}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(backgroundColor: type.color, content: Text('validates')),
  );
}
