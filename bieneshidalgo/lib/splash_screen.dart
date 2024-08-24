// ignore_for_file: unused_import
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:bieneshidalgo/users/admin_pages/admin_pages.dart';
import 'package:bieneshidalgo/users/log_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Istate extends StatelessWidget {
  static String id = 'main screen';
  const Istate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          builder: (context, snapshot) {
            if (kDebugMode) {
              print(snapshot);
            }
            if (snapshot.hasData) {
              return const AdminPage();
            } else {
              return const HomePage();
            }
          },
          stream: FirebaseAuth.instance.authStateChanges()),
    );
  }
}
