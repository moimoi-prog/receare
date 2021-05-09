import 'package:firebase_core/firebase_core.dart';

import 'AuthModule.dart';

// --------------------------------
// メソッド名 : initializeFirebase
// 処理概要　 : firebaseを初期化する
// --------------------------------
Future<void> initializeFirebase() async {
  // Firebaseを初期化する
  await Firebase.initializeApp();

  // Googleアカウントでログインする
  await signInWithGoogleSilently();
}
