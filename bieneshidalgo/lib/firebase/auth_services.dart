// ignore_for_file: unused_import, use_build_context_synchronously
import 'package:bieneshidalgo/firebase/fire_store.dart';
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:bieneshidalgo/users/admin_pages/admin_pages.dart';
import 'package:bieneshidalgo/users/olvide_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:windows_toast/windows_toast.dart';

class AuthServices {
  // ignore: non_constant_identifier_names
  Future<void> OlvideContra(email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const RecuperarPage()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> signout({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Future.delayed(const Duration(seconds: 1));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AdminPage()),
          (Route route) => false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
