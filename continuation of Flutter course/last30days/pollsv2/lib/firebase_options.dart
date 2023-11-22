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
    apiKey: 'AIzaSyB5SymUYdXZpUrXq3fgcIgIFzs9rccx-yo',
    appId: '1:509459383593:web:2e9d9f4a5493590d6b6338',
    messagingSenderId: '509459383593',
    projectId: 'polls-v2',
    authDomain: 'polls-v2.firebaseapp.com',
    storageBucket: 'polls-v2.appspot.com',
    measurementId: 'G-TE71W6MZE9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmBz0YkGU56tQMHPgbuJcSVQJ9Ir1JPhs',
    appId: '1:509459383593:android:23e12ab96b09fe096b6338',
    messagingSenderId: '509459383593',
    projectId: 'polls-v2',
    storageBucket: 'polls-v2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApDn06DwfcQM3_i_q0FDuY9oTlGtoVUrg',
    appId: '1:509459383593:ios:eee8392ccf4cdba56b6338',
    messagingSenderId: '509459383593',
    projectId: 'polls-v2',
    storageBucket: 'polls-v2.appspot.com',
    iosBundleId: 'com.example.pollsv2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApDn06DwfcQM3_i_q0FDuY9oTlGtoVUrg',
    appId: '1:509459383593:ios:942ca145aab208a46b6338',
    messagingSenderId: '509459383593',
    projectId: 'polls-v2',
    storageBucket: 'polls-v2.appspot.com',
    iosBundleId: 'com.example.pollsv2.RunnerTests',
  );
}
