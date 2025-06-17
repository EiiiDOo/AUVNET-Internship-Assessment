import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget customTextFormField({
  required TextFormType type,
  required TextEditingController? controller,
  required double width,
  String? Function(String?)? validator,
}) {
  return Container(
    width: width * 0.8,
    height: 60,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.inputFill.withAlpha(60),
    ),
    child: TextFormField(
      maxLines: 1,
      validator: validator,
      obscureText: type.isObscure,
      controller: controller,
      decoration: InputDecoration(
        focusedErrorBorder: InputBorder.none,
        icon: Icon(type.icon, color: AppColors.descText),
        hintText: type.hint,
        hintStyle: AppTextStyles.description,
        border: InputBorder.none,
      ),
    ),
  );
}

enum TextFormType {
  email,
  pass,
  confirmPass;

  String get hint => switch (this) {
    TextFormType.email => 'Mail',
    TextFormType.pass => 'Password',
    TextFormType.confirmPass => 'Confirm password',
  };

  bool get isObscure => switch (this) {
    TextFormType.pass => true,
    TextFormType.confirmPass => true,
    _ => false,
  };

  IconData get icon => switch (this) {
    TextFormType.email => Icons.email_outlined,
    TextFormType.pass => Icons.lock_outline,
    TextFormType.confirmPass => Icons.lock_outline,
  };
}
