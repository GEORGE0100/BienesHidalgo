// ignore_for_file: unused_import, avoid_print

import 'package:bieneshidalgo/components/constants.dart';
import 'package:bieneshidalgo/styles/app_br.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBr(
        appBar: AppBar(),
        title: 'BIENES HIDALGO',
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            drawersC(selectedIndex, onItemTapped, context),
            Expanded(flex: 4, child: widgetOptions[selectedIndex]),
          ],
        ),
      ),
    );
  }
}
