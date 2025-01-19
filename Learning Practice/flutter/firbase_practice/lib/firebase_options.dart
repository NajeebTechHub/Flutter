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
    apiKey: 'AIzaSyDisCeOCceIEtkwPxw1-eFyAegorIOiAjY',
    appId: '1:158947293981:web:5edc5dbd865a2b160a7ff4',
    messagingSenderId: '158947293981',
    projectId: 'fir-practice-58e1c',
    authDomain: 'fir-practice-58e1c.firebaseapp.com',
    storageBucket: 'fir-practice-58e1c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAMvi1uRkQp3ukOhOfSL9m53XPafbh3XU',
    appId: '1:158947293981:android:216eb63a4b1791710a7ff4',
    messagingSenderId: '158947293981',
    projectId: 'fir-practice-58e1c',
    storageBucket: 'fir-practice-58e1c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2TDoSXAWsVJTq4w9y-TbOQfmIb5Yp5gU',
    appId: '1:158947293981:ios:00401eeca6abf7390a7ff4',
    messagingSenderId: '158947293981',
    projectId: 'fir-practice-58e1c',
    storageBucket: 'fir-practice-58e1c.appspot.com',
    iosBundleId: 'com.example.firbasePractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2TDoSXAWsVJTq4w9y-TbOQfmIb5Yp5gU',
    appId: '1:158947293981:ios:00401eeca6abf7390a7ff4',
    messagingSenderId: '158947293981',
    projectId: 'fir-practice-58e1c',
    storageBucket: 'fir-practice-58e1c.appspot.com',
    iosBundleId: 'com.example.firbasePractice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDisCeOCceIEtkwPxw1-eFyAegorIOiAjY',
    appId: '1:158947293981:web:757f19a473ac04010a7ff4',
    messagingSenderId: '158947293981',
    projectId: 'fir-practice-58e1c',
    authDomain: 'fir-practice-58e1c.firebaseapp.com',
    storageBucket: 'fir-practice-58e1c.appspot.com',
  );
}
