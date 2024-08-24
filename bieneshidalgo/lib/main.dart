// ignore_for_file: avoid_print, unused_import

import 'dart:js';

import 'package:bieneshidalgo/blocs/bloc/users_bloc.dart';
import 'package:bieneshidalgo/splash_screen.dart';
import 'package:bieneshidalgo/styles/app_colors.dart';
import 'package:bieneshidalgo/styles/home_page.dart';
import 'package:bieneshidalgo/users/log_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await clearFirestoreCache();

  runApp(BlocProvider(create: (context) => UsersBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background2,
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: AppColors.background),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
          )),
      home: const Istate(),
    );
  }
}

Future<void> clearFirestoreCache() async {
  try {
    await FirebaseFirestore.instance.clearPersistence();
    print("Firestore cache cleared successfully.");
  } catch (e) {
    print("Failed to clear Firestore cache: $e");
  }
}
