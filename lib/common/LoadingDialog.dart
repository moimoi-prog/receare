
import 'package:flutter/material.dart';

// --------------------------------
// メソッド名 : showLoadingDialog
// 処理概要　 : 処理中ダイアログを表示する
// --------------------------------
void showLoadingDialog(BuildContext context) async{
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(microseconds: 0),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
  );
}