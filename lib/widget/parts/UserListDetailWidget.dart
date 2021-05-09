import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailPage.dart';
import 'package:receare/widget/parts/UserButtonWidget.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';

import '../../Const.dart';

// --------------------------------
// クラス名 　: UserListDetailWidget
// クラス概要 : ユーザー一覧要素
// --------------------------------
class UserListDetailWidget extends StatelessWidget {
  final Map<String, dynamic> userMap;

  const UserListDetailWidget({Key key, this.userMap // Shoutデータ
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
        Provider.of<UserDetailPageNotifier>(context, listen: false).load(userMap[Const.ID]);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return UserDetailPage();
            },
          ),
        );
      },
      child: Container(
        child: ListTile(
          leading: UserImageWidget(
            uid: userMap[Const.ID],
            radius: MediaQuery.of(context).size.width / 8,
            color: Colors.grey,
            profile: true,
          ),
          title: Text(
            userMap[Const.USER].data()[Const.NAME],
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            userMap[Const.USER].data()[Const.MESSAGE],
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          trailing: UserButtonWidget(uid: userMap[Const.USER].id),
        ),
      ),
    );
  }
}
