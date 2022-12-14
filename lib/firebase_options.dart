// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBKICeMDVPm8-o4NB380eL5Qf7eGfdVQQk',
    appId: '1:1011797608270:web:3d59f296b827f5f248c01f',
    messagingSenderId: '1011797608270',
    projectId: 'gif-app-be00f',
    authDomain: 'gif-app-be00f.firebaseapp.com',
    storageBucket: 'gif-app-be00f.appspot.com',
    measurementId: 'G-S46NQV8M5E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6YfgfVuYI0cXHGl2uvLhTtNk9HQ_EGIg',
    appId: '1:1011797608270:android:67a528192e6570f148c01f',
    messagingSenderId: '1011797608270',
    projectId: 'gif-app-be00f',
    storageBucket: 'gif-app-be00f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNcK_ndVNMjetwFRlvXxQUKT2_4duSV5M',
    appId: '1:1011797608270:ios:6c2ae215c4510ab948c01f',
    messagingSenderId: '1011797608270',
    projectId: 'gif-app-be00f',
    storageBucket: 'gif-app-be00f.appspot.com',
    iosClientId: '1011797608270-bhsqo5osmk86bguj4kor91ufo2t81cev.apps.googleusercontent.com',
    iosBundleId: 'com.example.gifApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNcK_ndVNMjetwFRlvXxQUKT2_4duSV5M',
    appId: '1:1011797608270:ios:6c2ae215c4510ab948c01f',
    messagingSenderId: '1011797608270',
    projectId: 'gif-app-be00f',
    storageBucket: 'gif-app-be00f.appspot.com',
    iosClientId: '1011797608270-bhsqo5osmk86bguj4kor91ufo2t81cev.apps.googleusercontent.com',
    iosBundleId: 'com.example.gifApp',
  );
}
