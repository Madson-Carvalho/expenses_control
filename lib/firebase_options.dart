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
    apiKey: 'AIzaSyANuw1Nmj0pZmMCvtZEV3uwANqeZvrCezA',
    appId: '1:67491554586:web:14ef4e42e838a00b4ef8a3',
    messagingSenderId: '67491554586',
    projectId: 'expenses-control-76a97',
    authDomain: 'expenses-control-76a97.firebaseapp.com',
    storageBucket: 'expenses-control-76a97.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt2G-_6jZ2E2SrFuX7awoSXOD_nWyGjjg',
    appId: '1:67491554586:android:07febe859eb51c254ef8a3',
    messagingSenderId: '67491554586',
    projectId: 'expenses-control-76a97',
    storageBucket: 'expenses-control-76a97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6EszcSvJXH1w3EMlWAEhn9gtAhzCUbqk',
    appId: '1:67491554586:ios:6d9630f7161b5d5c4ef8a3',
    messagingSenderId: '67491554586',
    projectId: 'expenses-control-76a97',
    storageBucket: 'expenses-control-76a97.appspot.com',
    iosBundleId: 'com.expenses.control.expensesControl',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6EszcSvJXH1w3EMlWAEhn9gtAhzCUbqk',
    appId: '1:67491554586:ios:6d9630f7161b5d5c4ef8a3',
    messagingSenderId: '67491554586',
    projectId: 'expenses-control-76a97',
    storageBucket: 'expenses-control-76a97.appspot.com',
    iosBundleId: 'com.expenses.control.expensesControl',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyANuw1Nmj0pZmMCvtZEV3uwANqeZvrCezA',
    appId: '1:67491554586:web:19a4f67aadd6b8684ef8a3',
    messagingSenderId: '67491554586',
    projectId: 'expenses-control-76a97',
    authDomain: 'expenses-control-76a97.firebaseapp.com',
    storageBucket: 'expenses-control-76a97.appspot.com',
  );
}
