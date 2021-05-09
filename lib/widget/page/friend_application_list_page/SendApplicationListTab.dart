import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/send_application_list_tab/SendApplicationListTabNotifier.dart';
import 'package:receare/state/send_application_list_tab/SendApplicationListTabState.dart';
import 'package:receare/widget/parts/UserListDetailWidget.dart';

// ----------------------------------------
// 送信フレンドリクエスト表示タブ
// ----------------------------------------
class SendApplicationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<SendApplicationListTabState>(context, listen: true).when(
      (sendMapList) {
        if (sendMapList.length == 0) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text("送信中のリクエストはありません"),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // 送信フレンドリクエスト情報を更新する
            Provider.of<SendApplicationListTabNotifier>(context, listen: false).reload();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemCount: sendMapList.length,
            itemBuilder: (context, index) {
              return UserListDetailWidget(userMap: sendMapList[index]);
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
