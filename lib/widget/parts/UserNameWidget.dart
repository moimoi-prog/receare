// ユーザープロフィール画像
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailPage.dart';

import '../../Const.dart';

// --------------------------------
// クラス名 　: UserNameWidget
// クラス概要 : ユーザー名
// --------------------------------
class UserNameWidget extends StatelessWidget {
  /* ユーザーid */ final String uid;
  /* プロフィールページへ遷移するか */ final bool profile;

  const UserNameWidget(
      {Key key,
        this.uid,
        this.profile = false
      })
      : assert(uid != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Const.USERS).doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
        // データ取得中に表示
        if (!doc.hasData) {
          return Text("");
        }

        // データを表示
        return InkWell(
          onTap: () {
            if (profile) {
              // プロフィールページ stateを更新
              Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
              Provider.of<UserDetailPageNotifier>(context, listen: false).load(uid);

              // プロフィールページへ遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UserDetailPage();
                  },
                ),
              );
            }
          },
          child: Text(
            doc.data.data()[Const.NAME],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
