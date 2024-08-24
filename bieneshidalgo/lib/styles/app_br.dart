// ignore_for_file: unused_import

import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:bieneshidalgo/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppBr extends StatefulWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;

  const AppBr({super.key, required this.appBar, required this.title});

  @override
  State<AppBr> createState() => _AppBrState();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class _AppBrState extends State<AppBr> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: <Color>[AppColors.background, AppColors.primary])),
      ),
      foregroundColor: AppColors.font2,
      title: Row(
        children: [
          Icon(Icons.home, size: 30, color: Colors.greenAccent.shade700),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  color: AppColors.font2),
            ),
          ),
        ],
      ),
    );
  }
}
