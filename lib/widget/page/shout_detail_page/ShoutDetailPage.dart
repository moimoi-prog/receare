import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/Const.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/data/ShoutData.dart';
import 'package:receare/firebase/CommentModule.dart';
import 'package:receare/state/shout_list_tab/ShoutListTabNotifier.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailPage.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/state/comment_sender/CommentSenderState.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';
import 'package:receare/widget/parts/UserNameWidget.dart';
import 'package:receare/widget/parts/shout_list_detail_widget/ShoutListDetailWidget.dart';

// --------------------------------
// クラス名 　: ShoutDetailPage
// クラス概要 : シャウト明細画面
// --------------------------------
class ShoutDetailPage extends StatelessWidget {
  /* シャウトデータ */ final ShoutData sd;

  ShoutDetailPage({Key key, this.sd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("シャウト")),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ShoutListDetailWidget(
                      sd: sd,
                      transition: false,
                    ),
                  ),
                  Divider(),
                  Column(
                    children: sd.commentQuery.docs.map(
                      (commentDoc) {
                        return _commentWidget(
                          context,
                          commentDoc,
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            _commentInputFieldWidget(context),
          ],
        ),
      ),
    );
  }

  // --------------------------------
  // メソッド名 　: _commentWidget
  // メソッド概要 : コメント表示用
  // --------------------------------
  Widget _commentWidget(BuildContext context, DocumentSnapshot commentDoc) {
    return ListTile(
      leading: InkWell(
        // プロフィール画面へ遷移
        onTap: () {
          // プロフィール画面stateを更新
          Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
          Provider.of<UserDetailPageNotifier>(context, listen: false).load(commentDoc.data()[Const.UID]);

          // プロフィール画面へ遷移
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return UserDetailPage();
              },
            ),
          );
        },

        // ユーザー画像
        child: UserImageWidget(
          uid: commentDoc[Const.UID],
          radius: MediaQuery.of(context).size.width / 10,
          color: Colors.grey,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ユーザー名
          UserNameWidget(
            uid: commentDoc.data()[Const.UID],
          ),

          // シャウト投稿日
          Text(
            getPassDate(commentDoc[Const.UPDATE].toDate()),
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      subtitle: StreamBuilder(
        stream: FirebaseFirestore.instance // Comment情報を取得
            .collection(Const.COMMENTS)
            .doc(commentDoc.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          // データ取得中の場合
          if (!doc.hasData) {
            return Text("", style: TextStyle(color: Colors.white));
          }

          // データの取得が完了した場合
          return Text(
            doc.data.data()[Const.DETAIL],
            style: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

  // --------------------------------
  // メソッド名 : _commentInputFieldWidget
  // 処理概要　 : コメント入力欄
  // --------------------------------
  Widget _commentInputFieldWidget(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            // コメント入力テキストボックス
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

            // コメント送信ボタン
            IconButton(
              icon: Icon(Icons.send),
              onPressed: !Provider.of<CommentSenderState>(context, listen: true).enabled
                  ? null
                  : () async {
                      await registerComment(sd.id, Provider.of<CommentSenderState>(context, listen: true).commentController.text);
                      Provider.of<CommentSenderNotifier>(context, listen: false).reset();
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
            )
          ],
        ),
      ),
    );
  }
}
