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
    apiKey: 'AIzaSyArL7igFgG2mHQY6wImipWl0sQRP11LZ3Y',
    appId: '1:844885580048:web:d7f5b02c1a6fb1d7d1ad95',
    messagingSenderId: '844885580048',
    projectId: 'fir-chat-c7b90',
    authDomain: 'fir-chat-c7b90.firebaseapp.com',
    storageBucket: 'fir-chat-c7b90.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAl90bxSs5ehodOvO4Vh9t6E7Vr2ziU-ew',
    appId: '1:844885580048:android:a3a9123a4797f8cfd1ad95',
    messagingSenderId: '844885580048',
    projectId: 'fir-chat-c7b90',
    storageBucket: 'fir-chat-c7b90.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDksyv9w4aY0cFUdfTf4BHid4zrFxDpXI4',
    appId: '1:844885580048:ios:383a9525571f4dcad1ad95',
    messagingSenderId: '844885580048',
    projectId: 'fir-chat-c7b90',
    storageBucket: 'fir-chat-c7b90.appspot.com',
    iosClientId: '844885580048-f6cq3a9ds47rj01ecmbgim0kkoj492l4.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDksyv9w4aY0cFUdfTf4BHid4zrFxDpXI4',
    appId: '1:844885580048:ios:383a9525571f4dcad1ad95',
    messagingSenderId: '844885580048',
    projectId: 'fir-chat-c7b90',
    storageBucket: 'fir-chat-c7b90.appspot.com',
    iosClientId: '844885580048-f6cq3a9ds47rj01ecmbgim0kkoj492l4.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChat',
  );
}
