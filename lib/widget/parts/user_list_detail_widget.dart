import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:receare/widget/parts/user_button_widget.dart';
import 'package:receare/widget/user_detail_screen/user_detail_screen.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_notifier.dart';
import 'package:receare/widget/parts/user_image_widget.dart';

import '../../strings.dart';

// ----------------------------------------
// ユーザー一覧表示パーツ
// ----------------------------------------
class UserListDetailWidget extends StatelessWidget {
  final Map<String, dynamic> userMap;

  const UserListDetailWidget({Key key, this.userMap // Shoutデータ
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<UserDetailScreenNotifier>(context, listen: false).reset();
        Provider.of<UserDetailScreenNotifier>(context, listen: false).load(userMap[Strings.ID]);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return UserDetailScreen();
            },
          ),
        );
      },
      child: Container(
        child: ListTile(
          leading: UserImageWidget(
            uid: userMap[Strings.ID],
            radius: MediaQuery.of(context).size.width / 8,
            color: Colors.grey,
            profile: true,
          ),
          title: Text(
            userMap[Strings.USER].data()[Strings.NAME],
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            userMap[Strings.USER].data()[Strings.MESSAGE],
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          trailing: UserButtonWidget(uid: userMap[Strings.USER].id),
        ),
      ),
    );
  }
}
