import 'package:flutter/material.dart';
import 'package:testchallange/core/constants/colors.dart';
import 'package:testchallange/elements/gradient_text.dart';

AppBar subscribeAppBar(BuildContext context) {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[AppColors.primary, AppColors.primaryLite],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final painter = Paint();
  painter.shader = linearGradient;

  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: false,
    title: const GradientText(
      'Subscribe',
      gradient: LinearGradient(
        colors: <Color>[AppColors.primary, AppColors.primaryLite],
      ),
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
