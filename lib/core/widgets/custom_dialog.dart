import 'package:flutter/material.dart';

void customLoadingDialog(BuildContext ctx) {
  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text("Wait..."),
      content: SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}

void customDialog({
  required BuildContext ctx,
  bool dismissible = true,
  Widget titleWidget = const Text("Dialog Title"),
  Widget contentWidget = const Text("Dialog content"),
  List<Widget>? actions,
}) {
  showDialog(
    context: ctx,
    barrierDismissible: dismissible,
    builder: (context) => AlertDialog(
      title: titleWidget,
      content: contentWidget,
      actions: actions,
    ),
  );
}
