// ユーザープロフィール画像
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/widget/user_detail_screen/user_detail_screen.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_notifier.dart';

import '../../strings.dart';

// ----------------------------------------
// ユーザー名
// ----------------------------------------
class UserNameWidget extends StatelessWidget {
  final String uid;
  final bool profile;

  const UserNameWidget(
      {Key key,
        this.uid, // ユーザーID
        this.profile = false //　タップ時にプロフィールへ遷移させるか
      })
      : assert(uid != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
        // データ取得中に表示
        if (!doc.hasData) {
          return Text("");
        }

        // データを表示
        return InkWell(
          onTap: () {
            if (profile) {
              Provider.of<UserDetailScreenNotifier>(context, listen: false).reset();
              Provider.of<UserDetailScreenNotifier>(context, listen: false).load(uid);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UserDetailScreen();
                  },
                ),
              );
            }
          },
          child: Text(
            // commentDoc[Strings.UID],
            doc.data.data()[Strings.NAME],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}