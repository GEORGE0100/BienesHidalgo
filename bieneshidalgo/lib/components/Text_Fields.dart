import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final TextInputType type;
  final bool expands;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.label,
      required this.type,
      required this.expands,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        expands: expands,
        maxLines: null,
        keyboardType: type,
        decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: Colors.white.withOpacity(0.7),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.primary),
                borderRadius: BorderRadius.circular(10)),
            constraints: const BoxConstraints(maxWidth: 200)),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyTexts extends StatelessWidget {
  String? label;
  MyTexts({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$label'.toUpperCase(),
            style: const TextStyle(fontSize: 17),
          )),
    );
  }
}
