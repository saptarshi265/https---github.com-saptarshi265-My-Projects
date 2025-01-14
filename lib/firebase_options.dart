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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA8tvMgVW_n8WfMDx60T5nqsutgHdfAWns',
    appId: '1:757938837140:web:d35ef0a1522718d7888681',
    messagingSenderId: '757938837140',
    projectId: 'yumm-food-app-2024',
    authDomain: 'yumm-food-app-2024.firebaseapp.com',
    storageBucket: 'yumm-food-app-2024.appspot.com',
    measurementId: 'G-2L1T8021KE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUicBcFyUxF58U23DcI-mJASnbfyJWctY',
    appId: '1:757938837140:android:cf3908515dc36055888681',
    messagingSenderId: '757938837140',
    projectId: 'yumm-food-app-2024',
    storageBucket: 'yumm-food-app-2024.appspot.com',
  );

}