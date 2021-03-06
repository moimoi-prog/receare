import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/Const.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/widget/parts/UserButtonWidget.dart';
import 'package:receare/state/user_detail_page/UserDetailPageState.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';

// --------------------------------
// クラス名 　: UserDetailDataWidget
// クラス概要 : ユーザー詳細データ
// --------------------------------
class UserDetailDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 画面の横 */
    double width = MediaQuery.of(context).size.width;

    return Provider.of<UserDetailPageState>(context, listen: true).when(
      (userDoc, shoutMapList) {
        return Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: (width / 3) + (width / 8) + 5,
                ),

                // 背景画像
                registeredKey(userDoc, Const.HEADER_IMAGE_PATH)
                    ? Container(
                        width: width,
                        height: width / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              userDoc.data()[Const.HEADER_IMAGE_PATH],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: width,
                        height: width / 3,
                        color: Colors.black,
                      ),

                // アイコン画像の枠
                Positioned(
                  left: (width / 2) - (width / 8) - 5,
                  top: (width / 3) - (width / 8) - 5,
                  child: ClipOval(
                    child: Container(
                      width: width / 4 + 10,
                      height: width / 4 + 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),

                // アイコン画像
                Positioned(
                  left: (width / 2) - (width / 8),
                  top: (width / 3) - (width / 8),
                  child: UserImageWidget(
                    uid: userDoc.id,
                    radius: width / 4,
                    color: Colors.grey,
                  ),
                ),

                // ユーザーメニューボタン
                Positioned(
                  top: width / 3,
                  child: Container(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        UserButtonWidget(uid: userDoc.id),
                      ],
                    ),
                    width: width,
                    height: width / 8,
                  ),
                ),
              ],
            ),

            // ユーザー名
            Text(
              userDoc.data()[Const.NAME],
            ),
          ],
        );
      },
      loading: () {
        return Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // 大きさ調整するやつ
                Container(
                  width: width,
                  height: (width / 3) + (width / 8) + 5,
                ),

                // 背景画像
                Container(
                  width: width,
                  height: width / 3,
                  color: Colors.black,
                ),

                // アイコン画像の枠
                Positioned(
                  left: (width / 2) - (width / 8) - 5,
                  top: (width / 3) - (width / 8) - 5,
                  child: ClipOval(
                    child: Container(
                      width: width / 4 + 10,
                      height: width / 4 + 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),

                // アイコン画像
                Positioned(
                  left: (width / 2) - (width / 8),
                  top: (width / 3) - (width / 8),
                  child: ClipOval(
                    child: Container(
                      width: width / 4,
                      height: width / 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
