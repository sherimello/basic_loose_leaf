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
    apiKey: 'AIzaSyCbzdBQK1uN4AA_HGYgrW-_4veco3enHAg',
    appId: '1:947329327372:web:c8aac9af4242a9ae6a6929',
    messagingSenderId: '947329327372',
    projectId: 'loose-leaf-87fea',
    authDomain: 'loose-leaf-87fea.firebaseapp.com',
    storageBucket: 'loose-leaf-87fea.firebasestorage.app',
    measurementId: 'G-Q498M2ZCWF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEGnALUfcycqOQy9TMj0pcWtYQ75X7hjg',
    appId: '1:947329327372:android:d99614ca1712299c6a6929',
    messagingSenderId: '947329327372',
    projectId: 'loose-leaf-87fea',
    storageBucket: 'loose-leaf-87fea.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAx3zJJfeIwWOWO-0sNN5_kx-5SQmL8aSM',
    appId: '1:947329327372:ios:41f06dd3440ac2f66a6929',
    messagingSenderId: '947329327372',
    projectId: 'loose-leaf-87fea',
    storageBucket: 'loose-leaf-87fea.firebasestorage.app',
    iosBundleId: 'com.example.looseLeaf',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAx3zJJfeIwWOWO-0sNN5_kx-5SQmL8aSM',
    appId: '1:947329327372:ios:41f06dd3440ac2f66a6929',
    messagingSenderId: '947329327372',
    projectId: 'loose-leaf-87fea',
    storageBucket: 'loose-leaf-87fea.firebasestorage.app',
    iosBundleId: 'com.example.looseLeaf',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbzdBQK1uN4AA_HGYgrW-_4veco3enHAg',
    appId: '1:947329327372:web:2b6d8ba56c479fa26a6929',
    messagingSenderId: '947329327372',
    projectId: 'loose-leaf-87fea',
    authDomain: 'loose-leaf-87fea.firebaseapp.com',
    storageBucket: 'loose-leaf-87fea.firebasestorage.app',
    measurementId: 'G-CSDRQHJLZF',
  );
}