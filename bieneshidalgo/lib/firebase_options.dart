// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBpsL5-vWBQemrNbF6jf_KmCD8hGNVWVxM',
    appId: '1:377917578946:web:4ec6b12ff0e03236c8a55b',
    messagingSenderId: '377917578946',
    projectId: 'bieneshidalgo-7b3ea',
    authDomain: 'bieneshidalgo-7b3ea.firebaseapp.com',
    storageBucket: 'bieneshidalgo-7b3ea.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWgVQgOKB5lEGliBylDheMuPlPKr7MB4w',
    appId: '1:377917578946:android:2b5bed571e852395c8a55b',
    messagingSenderId: '377917578946',
    projectId: 'bieneshidalgo-7b3ea',
    storageBucket: 'bieneshidalgo-7b3ea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtjTzoq2CcP6_vQ2axpJPIPARL8AGdtRo',
    appId: '1:377917578946:ios:308fb39c65e87cd5c8a55b',
    messagingSenderId: '377917578946',
    projectId: 'bieneshidalgo-7b3ea',
    storageBucket: 'bieneshidalgo-7b3ea.appspot.com',
    iosBundleId: 'com.example.bieneshidalgo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtjTzoq2CcP6_vQ2axpJPIPARL8AGdtRo',
    appId: '1:377917578946:ios:308fb39c65e87cd5c8a55b',
    messagingSenderId: '377917578946',
    projectId: 'bieneshidalgo-7b3ea',
    storageBucket: 'bieneshidalgo-7b3ea.appspot.com',
    iosBundleId: 'com.example.bieneshidalgo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBpsL5-vWBQemrNbF6jf_KmCD8hGNVWVxM',
    appId: '1:377917578946:web:6cc0029a2a9ad72ec8a55b',
    messagingSenderId: '377917578946',
    projectId: 'bieneshidalgo-7b3ea',
    authDomain: 'bieneshidalgo-7b3ea.firebaseapp.com',
    storageBucket: 'bieneshidalgo-7b3ea.appspot.com',
  );
}
