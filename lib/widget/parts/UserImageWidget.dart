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
  final String uid;
  final double radius;
  final Color color;
  final bool profile;

  const UserImageWidget(
      {Key key,
        this.uid, // ユーザーID
        this.radius, // 直径
        this.color, // 色
        this.profile = false //　タップ時にプロフィールへ遷移させるか
      })
      : assert(uid != null),
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
                Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
                Provider.of<UserDetailPageNotifier>(context, listen: false).load(uid);

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
              Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
              Provider.of<UserDetailPageNotifier>(context, listen: false).load(uid);

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

// --------------------------------
// クラス名 　: UserImageWidgetFromPath
// クラス概要 : ユーザープロフィール画像(パスから生成)
// --------------------------------
// ユーザープロフィール画像
class UserImageWidgetFromPath extends StatelessWidget {
  final String path;
  final double radius;
  final Color color;
  final bool profile;

  const UserImageWidgetFromPath(
      {Key key,
        this.path, // ユーザーID
        this.radius, // 直径
        this.color, // 色
        this.profile = false //　タップ時にプロフィールへ遷移させるか
      })
      : assert(path != null),
        assert(radius != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // データが存在しなかったときの処理
    if (path == null || path == "") {
      return InkWell(
        onTap: () {
          if (profile) {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return ProfilePage(uid: doc.data.data()[Strings.UID]);
            //     },
            //   ),
            // );
            Fluttertoast.showToast(msg: "プロフィール画面へ遷移");
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
    } else {
      // データを表示
      return InkWell(
        onTap: () {
          if (profile) {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return ProfilePage(uid: doc.data.data()[Strings.UID]);
            //     },
            //   ),
            // );
            Fluttertoast.showToast(msg: "プロフィール画面へ遷移");
          }
        },
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(path),
            ),
          ),
        ),
      );
    }
  }
}
