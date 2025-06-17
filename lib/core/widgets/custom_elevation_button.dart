import 'package:flutter/material.dart';

Widget customElevationButton({
  required void Function()? onPressed,
  required double width,
  required String text,
}) {
  return SizedBox(
    width: width * 0.9,
    child: ElevatedButton(onPressed: onPressed, child: Text(text)),
  );
}
