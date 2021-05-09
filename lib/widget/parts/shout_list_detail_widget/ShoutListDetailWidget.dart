import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/data/ShoutData.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/page/shout_detail_page/ShoutDetailPage.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailPage.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';
import 'package:receare/widget/parts/shout_list_detail_widget/ShoutListDetailCommentBottomSheet.dart';
import 'package:receare/widget/parts/shout_list_detail_widget/ShoutListDetailImage.dart';
import 'package:receare/widget/parts/shout_list_detail_widget/ShoutListDetailMenuButtomSheet.dart';

import '../../../Const.dart';

// --------------------------------
// クラス名 　: ShoutListDetailWidget
// クラス概要 : シャウトリスト要素
// --------------------------------
class ShoutListDetailWidget extends StatelessWidget {
  final ShoutData sd;
  final bool transition;

  const ShoutListDetailWidget({Key key, this.sd, this.transition = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (transition) {
          // シャウト要塞ページへ遷移
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ShoutDetailPage(
                  sd: sd,
                );
              },
            ),
          );
        }
      },
      child: Container(
        child: ListTile(
          leading: UserImageWidget(
            uid: sd.uid,
            radius: MediaQuery.of(context).size.width / 8,
            color: Colors.grey,
            profile: true,
          ),
          title: InkWell(
            onTap: () {
              // プロフィールページstateを更新
              Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
              Provider.of<UserDetailPageNotifier>(context, listen: false).load(sd.uid);

              // プロフィールページへ遷移
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
                  Text(
                    sd.userDoc[Const.NAME],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        getPassDate(sd.detail[Const.UPDATE].toDate()),
                        style: TextStyle(color: Colors.grey),
                      ),
                      if (sd.uid == user.uid)
                        GestureDetector(
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            showShoutListDetailMenuBottomSheet(context, sd.detail);
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
              if (sd.imagePathQuery.size > 0) ShoutListDetailImage(imagePathQuery: sd.imagePathQuery),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                child: Text(
                  sd.detail[Const.DETAIL],
                  style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
                ),
              ),
              InkWell(
                onTap: () {
                  // コメント記入シートの内容をリセットする
                  Provider.of<CommentSenderNotifier>(context, listen: false).reset();

                  // コメント記入シートを表示
                  showShoutListDetailCommentBottomSheet(context, sd.id);
                },
                child: StreamBuilder(
                  initialData: sd.commentQuery,
                  stream: FirebaseFirestore.instance // Comment内容を取得
                      .collection(Const.SHOUTS)
                      .doc(sd.id)
                      .collection(Const.COMMENTS)
                      .orderBy(Const.CREATE, descending: true)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> commentQuery) {
                    if (!commentQuery.hasData) {
                      return Text(
                        "コメントする",
                        style: TextStyle(color: Colors.grey),
                      );
                    }

                    sd.commentQuery = commentQuery.data;

                    return Row(
                      children: <Widget>[
                        sd.commentQuery.size > 0
                            ? Text(
                                "コメントする (+" + sd.commentQuery.size.toString() + "件)",
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
