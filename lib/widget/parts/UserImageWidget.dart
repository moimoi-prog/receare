import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailPage.dart';

import '../../Const.dart';

// --------------------------------
// クラス名 　: UserImageWidget
// クラス概要 : ユーザープロフィール画像
// --------------------------------
class UserImageWidget extends StatelessWidget {
  /* ユーザーID 　　　　　　　　　　*/ final String uid;
  /* 画像半径 　　　　　　　　　　　*/ final double radius;
  /* ない場合に表示する画像の色 　　*/ final Color color;
  /* プロフィールページへ遷移するか */ final bool profile;

  const UserImageWidget({
    Key key,
    this.uid,
    this.radius,
    this.color,
    this.profile = false,
  })  : assert(uid != null),
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Const.USERS).doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
        // データ取得中に表示
        if (!doc.hasData) {
          return Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          );
        }

        // データが存在しなかったときの処理
        if (!doc.data.data().containsKey(Const.ICON_IMAGE_PATH) // パラメータが存在しない場合
                ||
                doc.data.data()[Const.ICON_IMAGE_PATH] == null // あるがnullの場合
                ||
                doc.data.data()[Const.ICON_IMAGE_PATH] == "" // あるが""の場合
            ) {
          return InkWell(
            onTap: () {
              if (profile) {
                // プロフィールページstateをリセット
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
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
          );
        }

        // データを表示
        return InkWell(
          onTap: () {
            if (profile) {
              // プロフィールページstateを更新
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
          child: Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(doc.data.data()[Const.ICON_IMAGE_PATH]),
              ),
            ),
          ),
        );
      },
    );
  }
}