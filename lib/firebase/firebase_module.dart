import 'package:firebase_core/firebase_core.dart';

import 'auth_module.dart';

// ------------------------------
// firebaseを初期化する
// ------------------------------
Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
  await signInWithGoogleSilently();
}
