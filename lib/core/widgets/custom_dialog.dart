import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

void customLoadingDialog(BuildContext ctx) {
  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
            SizedBox(height: 16),
            Text("Loading...", style: TextStyle(fontSize: 16)),
          ],
        ),
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
