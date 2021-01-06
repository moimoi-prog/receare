import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:receare/common/common_module.dart';
import 'package:receare/firebase/comment_module.dart';
import 'package:receare/state/comment_sender/comment_sender_state.dart';
import 'package:receare/widget/shout_detail_screen/shout_detail_screen.dart';
import 'package:receare/state/comment_sender/comment_sender_notifier.dart';
import 'package:receare/widget/parts/user_image_widget.dart';

import '../../strings.dart';

// ----------------------------------------
// シャウト一覧表示パーツ
// ----------------------------------------
class ShoutListDetailWidget extends StatelessWidget {
  final Map<String, dynamic> shoutMap;

  const ShoutListDetailWidget({Key key, this.shoutMap // Shoutデータ
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ShoutDetailScreenへ遷移
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ShoutDetailScreen(
                shoutMap: shoutMap,
              );
            },
          ),
        );
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
              Fluttertoast.showToast(msg: "ShoutDetailScreenへ遷移する");
            },
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
                Text(
                  getPassDate(shoutMap[Strings.SHOUT][Strings.UPDATE].toDate()),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
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
                    return ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(
                                query.docs[0].data()[Strings.PATH],
                              ),
                            ),
                          ),
                        )
                    );
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
                  Provider.of<CommentSenderNotifier>(context, listen: false).reset();
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
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ),
                                )),
                            ListTile(
                                title: Text('キャンセル', style: TextStyle(color: Colors.red)),
                                onTap: () {
                                  Navigator.of(context).pop();
                                }),
                          ],
                        ),
                      );
                    },
                  );
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