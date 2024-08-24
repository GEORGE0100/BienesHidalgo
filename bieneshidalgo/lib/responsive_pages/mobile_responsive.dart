// ignore_for_file: unused_import

import 'package:bieneshidalgo/components/constants.dart';
import 'package:bieneshidalgo/styles/app_br.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  final String title = 'B';
  final String title2 = 'H';

  @override
  State<MobileScaffold> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MobileScaffold> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int page = 0;
  List<bool> isPressed = <bool>[true, false, false, false];
  void onItem2(int index) {
    setState(() {
      page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBr(appBar: AppBar(), title: 'BH'),
        backgroundColor: Colors.grey.shade200,
        body: Row(
          children: [
            Expanded(flex: 1, child: widgetOptions[_selectedIndex]),
          ],
        ),
        drawer: drawersC(_selectedIndex, _onItemTapped, context));
  }
}
