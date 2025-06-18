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
  String content = 'Content',
}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      backgroundColor: type.color,
      content: Text(content, style: TextStyle(fontWeight: FontWeight.bold)),
      padding: EdgeInsets.all(8),
      action: SnackBarAction(
        label: 'Cancel',
        onPressed: () {
          ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
        },
        textColor: Colors.grey[200],
      ),
    ),
  );
}
