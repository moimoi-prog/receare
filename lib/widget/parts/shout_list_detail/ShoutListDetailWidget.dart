import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/state/user_detail_screen/UserDetailPageNotifier.dart';
import 'package:receare/widget/parts/shout_list_detail/ShoutListDetailCommentBottomSheet.dart';
import 'package:receare/widget/parts/shout_list_detail/ShoutListDetailMenuButtomSheet.dart';
import 'package:receare/widget/parts/shout_list_detail/ShoutListDetailImage.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';
import 'package:receare/widget/shout_detail_page/ShoutDetailPage.dart';
import 'package:receare/widget/user_detail_page/UserDetailPage.dart';

import '../../../strings.dart';

// ----------------------------------------
// シャウト一覧表示パーツ
// ----------------------------------------
class ShoutListDetailWidget extends StatelessWidget {
  final Map<String, dynamic> shoutMap;
  final bool transition;

  const ShoutListDetailWidget({Key key, this.shoutMap, this.transition = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ShoutDetailPageへ遷移
        if (transition) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ShoutDetailPage(
                  shoutMap: shoutMap,
                );
              },
            ),
          );
        }
      },
      child: Container(
        child: ListTile(
          leading: StreamBuilder(
            initialData: shoutMap[Strings.USER],
            stream: FirebaseFirestore.instance // User情報を取得
                .collection(Strings.USERS)
                .doc(shoutMap[Strings.SHOUT][Strings.UID])
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> userDoc) {
              if (!userDoc.hasData) {
                return Container(
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.width / 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                );
              }

              shoutMap[Strings.USER] = userDoc.data;

              return UserImageWidget(
                uid: shoutMap[Strings.USER].id,
                radius: MediaQuery.of(context).size.width / 8,
                color: Colors.grey,
                profile: true,
              );
            },
          ),
          title: InkWell(
            onTap: () {
              Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
              Provider.of<UserDetailPageNotifier>(context, listen: false).load(shoutMap[Strings.USER].id);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UserDetailPage();
                  },
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StreamBuilder(
                    initialData: shoutMap[Strings.USER],
                    stream: FirebaseFirestore.instance // User情報を取得
                        .collection(Strings.USERS)
                        .doc(shoutMap[Strings.SHOUT][Strings.UID])
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> userDoc) {
                      if (!userDoc.hasData) {
                        return Text("");
                      }

                      shoutMap[Strings.USER] = userDoc.data;

                      return Text(
                        shoutMap[Strings.USER][Strings.NAME],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        getPassDate(shoutMap[Strings.SHOUT][Strings.UPDATE].toDate()),
                        style: TextStyle(color: Colors.grey),
                      ),
                      if (shoutMap[Strings.SHOUT].data()[Strings.UID] == user.uid)
                        GestureDetector(
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            showShoutListDetailMenuBottomSheet(context, shoutMap[Strings.SHOUT]);
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StreamBuilder(
                initialData: shoutMap[Strings.IMAGE_PATH],
                stream: FirebaseFirestore.instance // User情報を取得
                    .collection(Strings.SHOUTS)
                    .doc(shoutMap[Strings.ID])
                    .collection(Strings.IMAGE_PATH)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> imageQuery) {
                  if (!imageQuery.hasData) {
                    return Text("");
                  }

                  shoutMap[Strings.IMAGE_PATH] = imageQuery.data;

                  QuerySnapshot query = imageQuery.data as QuerySnapshot;

                  if (query.size > 0) {
                    return ShoutListDetailImage(query: query);
                  }

                  return Padding(padding: EdgeInsets.all(0));
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                child: Text(
                  shoutMap[Strings.SHOUT][Strings.DETAIL],
                  style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
                ),
              ),
              InkWell(
                onTap: () {
                  // コメント記入シートの内容をリセットする
                  Provider.of<CommentSenderNotifier>(context, listen: false).reset();

                  // コメント記入シートを表示
                  showShoutListDetailCommentBottomSheet(context, shoutMap[Strings.ID]);
                },
                child: StreamBuilder(
                  initialData: shoutMap[Strings.COMMENTS],
                  stream: FirebaseFirestore.instance // Comment内容を取得
                      .collection(Strings.SHOUTS)
                      .doc(shoutMap[Strings.SHOUT].id)
                      .collection(Strings.COMMENTS)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> commentDocs) {
                    if (!commentDocs.hasData) {
                      return Text(
                        "コメントする",
                        style: TextStyle(color: Colors.grey),
                      );
                    }

                    shoutMap[Strings.COMMENTS] = commentDocs.data;

                    return Row(
                      children: <Widget>[
                        commentDocs.data.size > 0
                            ? Text(
                                "コメントする (+" + shoutMap[Strings.COMMENTS].size.toString() + "件)",
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                "コメントする",
                                style: TextStyle(color: Colors.grey),
                              ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
