import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/AuthModule.dart';

// --------------------------------
// クラス名 　: LoginPage
// クラス概要 : ログイン用ページ
// --------------------------------
class LoginPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ログイン"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                // googleログイン用ボタン
                child: _googleLoginButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------------
  // メソッド名 : _googleLoginButton
  // 処理概要　 : Googleログイン用ボタン
  // --------------------------------
  Widget _googleLoginButton(BuildContext context) {
    return GestureDetector(
      child: Text(
        "Googleでサインイン",
        style: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      onTap: () async {
        // Googleログイン処理を実行
        showLoadingDialog(context);
        await signInWithGoogle();
        Navigator.of(context).pop();

        // ログインした場合、メイン画面へ遷移
        if (user != null) {
          Navigator.pushReplacementNamed(context, "/main");
        }
      },
    );
  }
}
