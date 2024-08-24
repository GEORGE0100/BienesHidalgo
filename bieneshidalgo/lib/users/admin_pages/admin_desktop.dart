// ignore_for_file: unused_import

import 'package:bieneshidalgo/components/constants.dart';
import 'package:bieneshidalgo/styles/app_br.dart';
import 'package:flutter/material.dart';

class DesktopAdminScaffold extends StatefulWidget {
  const DesktopAdminScaffold({super.key});

  @override
  State<DesktopAdminScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopAdminScaffold> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBr(appBar: AppBar(), title: 'BIENES HIDALGO'),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            drawers(selectedIndex, onItemTapped, context),
            Expanded(flex: 4, child: widgetOptions2[selectedIndex]),
          ],
        ),
      ),
    );
  }
}
