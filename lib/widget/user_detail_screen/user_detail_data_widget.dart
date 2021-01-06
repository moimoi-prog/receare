import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/common_module.dart';
import 'package:receare/widget/parts/user_button_widget.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_state.dart';
import 'package:receare/widget/parts/user_image_widget.dart';

import '../../strings.dart';

// ------------------------------------
// プロフィールデータパーツ
// ------------------------------------
class UserDetailDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 画面の横 */
    double width = MediaQuery.of(context).size.width;

    return Provider.of<UserDetailScreenState>(context, listen: true).when(
      (userDoc, shoutMapList) {
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
                registeredKey(userDoc, Strings.HEADER_IMAGE_PATH)
                    ? Container(
                        width: width,
                        height: width / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              userDoc.data()[Strings.HEADER_IMAGE_PATH],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: width,
                        height: width / 3,
                        color: Colors.black,
                      ),

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

                // ユーザーイメージ
                Positioned(
                  left: (width / 2) - (width / 8),
                  top: (width / 3) - (width / 8),
                  child: UserImageWidget(
                    uid: userDoc.id,
                    radius: width / 4,
                    color: Colors.grey,
                  ),
                ),
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
            Text(
              userDoc.data()[Strings.NAME],
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

                // ユーザーイメージ
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
