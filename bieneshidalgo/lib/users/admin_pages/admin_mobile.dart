// ignore_for_file: unused_import

import 'package:bieneshidalgo/components/constants.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MobileAdminScaffold extends StatefulWidget {
  const MobileAdminScaffold({super.key});

  final String title = 'B';
  final String title2 = 'H';

  @override
  State<MobileAdminScaffold> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MobileAdminScaffold> {
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
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[AppColors.background, AppColors.primary])),
          ),
          foregroundColor: AppColors.font2,
          title: Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: AppColors.font2),
              ),
              Text(
                widget.title2,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: AppColors.font2),
              ),
            ],
          ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: Row(
          children: [
            //Expanded(flex: 1, child: widgetOptions2[_selectedIndex]),
          ],
        ),
        drawer: drawers(_selectedIndex, _onItemTapped, context));
  }
}
