import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: const TextStyle(color: AppColors.font2),
    );
  }
}
