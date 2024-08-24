// ignore_for_file: unused_import

import 'package:bieneshidalgo/admin_pages.dart/add_page.dart';
import 'package:bieneshidalgo/blocs/bloc/users_bloc.dart';
import 'package:bieneshidalgo/firebase/auth_services.dart';
import 'package:bieneshidalgo/firebase/fire_store.dart';
import 'package:bieneshidalgo/pages/homes_page.dart';
import 'package:bieneshidalgo/pages/show_page.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:bieneshidalgo/users/log_in.dart';
import 'package:bieneshidalgo/users/log_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

drawers(int options, void Function(int index) tap, BuildContext context) {
  String uid = readUser();
  int op = options;
  return Drawer(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0))),
    backgroundColor: Colors.grey.shade200,
    elevation: 0,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            child: Column(
          children: [
            const Icon(Icons.account_circle_rounded, size: 60),
            const SizedBox(height: 5),
            FutureBuilder(
                future: recop(uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data?.name as String,
                      style:
                          const TextStyle(color: AppColors.font, fontSize: 20),
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      "",
                      style: TextStyle(color: AppColors.font),
                    );
                  }
                  return const Text(
                    "",
                    style: TextStyle(color: AppColors.font),
                  );
                }),
            const SizedBox(height: 5),
          ],
        )),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.home),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'D A S H B O A R D',
                ),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 0,
          onTap: () {
            tap(0);
            if (MediaQuery.of(context).size.width < 1100) {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.settings),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'C O N F I G U R A C I Ó N',
                ),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 1,
          onTap: () {
            tap(1);
            if (MediaQuery.of(context).size.width < 1100) {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.account_circle),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'P E R F I L',
                ),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 2,
          onTap: () {
            tap(2);
            if (MediaQuery.of(context).size.width < 1100) {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.logout),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'C E R R A R  S E S I Ó N',
                ),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 4,
          onTap: () {
            AuthServices().signout(context: context);
          },
        )
      ],
    ),
  );
}

List<Widget> widgetOptions = <Widget>[
  const HomesPage(),
  ShowPage(tipo: 'CASA'),
  ShowPage(
    tipo: 'TERRENO',
  )
];

List<Widget> widgetOptions2 = <Widget>[
  const AddPage(),
  const Text(
    '',
  ),
  const Text(
    '',
  ),
  const Text(
    '',
  ),
];

drawersC(int options, void Function(int index) tap, BuildContext context) {
  int op = options;
  return Drawer(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0))),
    backgroundColor: Colors.grey.shade200,
    elevation: 0,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            child: Column(
          children: [
            const Icon(Icons.account_circle_rounded, size: 60),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route route) => false);
              },
              style: TextButton.styleFrom(foregroundColor: AppColors.primaryD),
              child: const Text(
                'Iniciar Sesión',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignUpPage()));
              },
              style: TextButton.styleFrom(foregroundColor: AppColors.primaryD),
              child: const Text('Registrarse'),
            ),
          ],
        )),
        ListTile(
          title: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'H O M E',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 0,
          onTap: () {
            tap(0);
            if (MediaQuery.of(context).size.width < 1100) {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text('C A S A S',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 1,
          onTap: () {
            tap(1);
            if (MediaQuery.of(context).size.width < 1100) {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'T E R R E N O S',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          selectedColor: AppColors.primary,
          selected: op == 2,
          onTap: () {
            tap(2);
            if (MediaQuery.of(context).size.width < 1100) {
              Navigator.pop(context);
            }
          },
        )
      ],
    ),
  );
}
