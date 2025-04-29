import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8l958SeAg7b2q2PAxH-OQmPF3iNRQahA',
    appId: '1:559317773806:android:ec38dbb19ffecd522fb2ff',
    messagingSenderId: '559317773806',
    projectId: 'markonehq-bookmark',
    storageBucket: 'markonehq-bookmark.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnfJ1qKRg4-T6-gdx5507txtUaCnsjZpE',
    appId: '1:559317773806:ios:003149507d01538b2fb2ff',
    messagingSenderId: '559317773806',
    projectId: 'markonehq-bookmark',
    storageBucket: 'markonehq-bookmark.firebasestorage.app',
    iosBundleId: 'com.markone.bookmark',
  );
}
