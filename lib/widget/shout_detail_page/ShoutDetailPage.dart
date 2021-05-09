import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/firebase/CommentModule.dart';
import 'package:receare/widget/parts/shout_list_detail/ShoutListDetailWidget.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/state/comment_sender/CommentSenderState.dart';
import 'package:receare/state/shout_list_page/ShoutListPageNotifier.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';
import 'package:receare/widget/parts/UserNameWidget.dart';
import 'package:receare/widget/user_detail_page/UserDetailPage.dart';

import '../../Strings.dart';

// --------------------------------
// クラス名 　: ShoutDetailPage
// クラス概要 : シャウト明細画面
// --------------------------------
class ShoutDetailPage extends StatelessWidget {
  /* shoutデータ */ final Map<String, dynamic> shoutMap;

  ShoutDetailPage({Key key, this.shoutMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("シャウト")),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: ShoutListDetailWidget(
                shoutMap: shoutMap,
                transition: false,
              ),
            ),
            Divider(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  Provider.of<ShoutListPageNotifier>(context, listen: false).reloadComments(shoutMap[Strings.ID]);
                },
                child: ListView.builder(
                  // padding: EdgeInsets.only(right: 5.0, left: 5.0),
                  // separatorBuilder: (BuildContext context, index) {
                  //   return Divider();
                  // },
                  itemCount: shoutMap[Strings.COMMENTS].size,
                  itemBuilder: (context, index) {
                    return _commentWidget(
                      context,
                      shoutMap[Strings.COMMENTS].docs[index],
                    );
                  },
                ),
              ),
            ),
            _commentInputFieldWidget(context)
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
          Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
          Provider.of<UserDetailPageNotifier>(context, listen: false).load(commentDoc.data()[Strings.UID]);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return UserDetailPage();
              },
            ),
          );
        },
        child: UserImageWidget(
          uid: commentDoc[Strings.UID],
          radius: MediaQuery.of(context).size.width / 10,
          color: Colors.grey,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserNameWidget(
            uid: commentDoc.data()[Strings.UID],
          ),
          Text(
              " " +
                  getPassDate(
                    commentDoc[Strings.UPDATE].toDate(),
                  ),
              style: TextStyle(color: Colors.grey)),
        ],
      ),
      subtitle: StreamBuilder(
        stream: FirebaseFirestore.instance // Comment情報を取得
            .collection(Strings.COMMENTS)
            .doc(commentDoc.id)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          if (!doc.hasData) {
            return Text("", style: TextStyle(color: Colors.white));
          }

          return Text(
            // コメント内容
            doc.data.data()[Strings.DETAIL],
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
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(hintText: "コメントを送信"),
                controller: Provider.of<CommentSenderState>(context, listen: true).commentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  if (value != null && value != "") {
                    Provider.of<CommentSenderNotifier>(context, listen: false).change(true);
                  } else {
                    Provider.of<CommentSenderNotifier>(context, listen: false).change(false);
                  }
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: !Provider.of<CommentSenderState>(context, listen: true).enabled
                  ? null
                  : () async {
                      await registerComment(
                        shoutMap[Strings.ID],
                        Provider.of<CommentSenderNotifier>(context, listen: false).getText(),
                      );
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
