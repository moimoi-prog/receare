import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:receare/firebase/auth_module.dart';
import 'package:receare/firebase/user_module.dart';
import 'package:receare/state/friend_list_screen/friend_list_screen_notifier.dart';
import 'package:receare/state/send_application_list_screen/send_application_list_screen_notifier.dart';
import 'package:receare/widget/user_update_screen/user_update_screen.dart';

import '../../strings.dart';

// ----------------------------------------
// クラス名　: UserButtonWidgetWidget
// クラス概要: Shout明細
// ----------------------------------------
class UserButtonWidget extends StatelessWidget {
  final String uid;

  const UserButtonWidget({
    Key key,
    this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (uid == user.uid) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance // フレンドであるか判定
            .collection(Strings.USERS)
            .doc(user.uid)
            .snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          if (!doc.hasData) {
            return Text("");
          }

          return ProfileDataSettingButton(userDoc: doc.data);
        },
      );
    } else {
      return StreamBuilder(
        stream: FirebaseFirestore.instance // フレンドであるか判定
            .collection(Strings.USERS)
            .doc(user.uid)
            .collection(Strings.FRIENDS)
            .doc(uid)
            .snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          if (!doc.hasData) {
            return Text("");
          }

          if (doc.data.exists) {
            // フレンドであることを示す
            return FriendButton(
              color: Theme.of(context).primaryColor,
              uid: uid,
            );
          } else {
            return StreamBuilder(
              stream: FirebaseFirestore.instance // フレンドリクエストを送信中であるか判定
                  .collection(Strings.USERS)
                  .doc(user.uid)
                  .collection(Strings.SEND_APPLICATIONS)
                  .doc(uid)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                if (!doc.hasData) {
                  return Text("");
                }

                if (doc.data.exists) {
                  // 送信取り消しボタンを表示
                  return RejectButton(color: Theme.of(context).primaryColor, uid: uid);
                }

                return StreamBuilder(
                  stream: FirebaseFirestore.instance // フレンドリクエストを受信中であるか判定
                      .collection(Strings.USERS)
                      .doc(user.uid)
                      .collection(Strings.RECEPTION_APPLICATIONS)
                      .doc(uid)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                    if (!doc.hasData) {
                      return Text("");
                    }

                    if (doc.data.exists) {
                      // 承認ボタンを表示
                      return ConfirmButton(color: Theme.of(context).primaryColor, uid: uid);
                    }

                    // リクエストを送信する
                    return SendButton(color: Theme.of(context).primaryColor, uid: uid);
                  },
                );
              },
            );
          }
        },
      );
    }
  }
}

class ProfileDataSettingButton extends StatelessWidget {
  /* Userドキュメント */ final DocumentSnapshot userDoc;

  const ProfileDataSettingButton({Key key, this.userDoc})
      : assert(userDoc != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("編集"),
      color: Theme.of(context).primaryColor,
      shape: StadiumBorder(),
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return UserUpdateScreen(userDoc: userDoc);
            },
          ),
        );
      },
    );
  }
}

class FriendButton extends StatelessWidget {
  final Color color;
  final String uid;

  const FriendButton({Key key, this.color, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("フレンド"),
      color: color,
      shape: StadiumBorder(),
      onPressed: () async {
        showModalBottomSheet<int>(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: ListView(
                children: <Widget>[
                  Text("フレンドを解除しますか？"),
                  ListTile(
                    title: Text('解除する'),
                    onTap: () {
                      rejectFriend(user.uid, uid);
                      Navigator.of(context).pop();
                    },
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
      },
    );
  }
}

// ------------------------------------
// 送信取り消しボタンパーツ
// ------------------------------------
class RejectButton extends StatelessWidget {
  final Color color;
  final String uid;

  const RejectButton({Key key, this.color, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("取消"),
      color: color,
      shape: StadiumBorder(),
      onPressed: () async {
        await rejectFriendRequest(user.uid, uid);
      },
    );
  }
}

// ------------------------------------
// フレンド申請承認ボタンパーツ
// ------------------------------------
class ConfirmButton extends StatelessWidget {
  final Color color;
  final String uid;

  const ConfirmButton({
    Key key,
    this.color,
    this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("承認"),
      color: color,
      shape: StadiumBorder(),
      onPressed: () async {
        await apploveFriendRequest(user.uid, uid);
      },
      onLongPress: () async {
        await rejectFriendRequest(user.uid, uid);
      },
    );
  }
}

// ------------------------------------
// フレンド申請送信ボタンパーツ
// ------------------------------------
class SendButton extends StatelessWidget {
  final Color color;
  final String uid;

  const SendButton({Key key, this.color, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("申請"),
      color: Theme.of(context).backgroundColor,
      shape: StadiumBorder(),
      onPressed: () async {
        await sendFriendRequest(user.uid, uid);
      },
    );
  }
}
