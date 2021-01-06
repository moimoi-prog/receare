import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receare/firebase/auth_module.dart';
import 'package:receare/firebase/firebase_module.dart';

// ----------------------------------
// スプラッシュ画面(最初に表示される画面)
// ----------------------------------
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初期設定
    initializeFirebase().then(// Firebase関連のやつをインスタンス化
        (_) => user == null
            ? Navigator.pushReplacementNamed(context, "/login") // userを取得できなかった場合
            : Navigator.pushReplacementNamed(context, "/main") // userを取得できた場合
        );

    // 処理中画面
    return Scaffold(
      body: Center(
        child: Text("データ読み込み中"),
      ),
    );
  }
}
