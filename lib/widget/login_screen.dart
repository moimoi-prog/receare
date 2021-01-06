import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:receare/common/loading_dialog.dart';
import 'package:receare/firebase/auth_module.dart';

// ------------------------------------
// ログインページ
// ------------------------------------
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

  // googleログイン用ボタン
  Widget _googleLoginButton(BuildContext context) {
    return RaisedButton(
      child: Text(
        "Googleでサインイン",
        style: TextStyle(
          fontFamily: 'Roboto',
        ),
      ),
      onPressed: () async {
        showLoadingDialog(context);
        await signInWithGoogle();
        Navigator.of(context).pop();

        if (user != null) {
          Navigator.pushReplacementNamed(context, "/main");
        }
      },
    );
  }
}
