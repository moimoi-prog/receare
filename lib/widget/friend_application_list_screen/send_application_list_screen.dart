import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/send_application_list_screen/send_application_list_screen_notifier.dart';
import 'package:receare/state/send_application_list_screen/send_application_list_screen_state.dart';
import 'package:receare/widget/parts/user_list_detail_widget.dart';

import '../../strings.dart';

// ----------------------------------------
// 送信フレンドリクエスト表示タブ
// ----------------------------------------
class SendApplicationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<SendApplicationListScreenState>(context, listen: true).when(
      (friendMapList) {
        if (friendMapList.length == 0) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text("送信中のリクエストはありません"),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // Shoutを更新する
            Provider.of<SendApplicationListScreenNotifier>(context, listen: false).reload();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemCount: friendMapList.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> sendMap = friendMapList[index];

              return UserListDetailWidget(userMap: sendMap);
            },
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}