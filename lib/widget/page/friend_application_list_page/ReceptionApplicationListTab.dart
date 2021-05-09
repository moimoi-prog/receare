import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/reception_application_list_tab/ReceptionApplicationListTabNotifier.dart';
import 'package:receare/state/reception_application_list_tab/ReceptionApplicationListTabState.dart';
import 'package:receare/widget/parts/UserListDetailWidget.dart';

// --------------------------------
// クラス名 　: ReceptionApplicationListPage
// クラス概要 : 受信フレンドリクエスト表示タブ
// --------------------------------
class ReceptionApplicationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ReceptionApplicationListTabState>(context, listen: true).when(
      (receptionMapList) {
        if (receptionMapList.length == 0) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text("受信中のリクエストはありません"),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // 受信フレンドリクエスト情報を更新する
            Provider.of<ReceptionApplicationListTabNotifier>(context, listen: false).reload();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemCount: receptionMapList.length,
            itemBuilder: (context, index) {
              return UserListDetailWidget(userMap: receptionMapList[index]);
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
