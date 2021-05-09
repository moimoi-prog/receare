import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/firebase/CommentModule.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/state/comment_sender/CommentSenderState.dart';

// --------------------------------
// メソッド名 : showShoutListDetailCommentBottomSheet
// 処理概要　 : シャウトコメントシート表示
// --------------------------------
void showShoutListDetailCommentBottomSheet(
  BuildContext context,
  String shoutId,
) {
// コメント記入シートを表示
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "コメントを送信"),
                        controller: Provider.of<CommentSenderState>(context, listen: true).commentController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          if (value != null && value != "") {
                            Provider.of<CommentSenderNotifier>(context, listen: false).setEnabled(true);
                          } else {
                            Provider.of<CommentSenderNotifier>(context, listen: false).setEnabled(false);
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: !Provider.of<CommentSenderState>(context, listen: true).enabled
                          ? null
                          : () async {
                              await registerComment(shoutId, Provider.of<CommentSenderNotifier>(context, listen: false).getText());
                              Provider.of<CommentSenderNotifier>(context, listen: false).reset();
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.of(context).pop();
                            },
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('キャンセル', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
