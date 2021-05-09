import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_list_page/UserListPageNotifier.dart';
import 'package:receare/state/user_list_page/UserListPageState.dart';
import 'package:receare/widget/parts/UserListDetailWidget.dart';

import '../../Strings.dart';

// --------------------------------
// クラス名 　: UserListPage
// クラス概要 : ユーザー一覧ページ
// --------------------------------
class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
      ),
      body: Provider.of<UserListPageState>(context, listen: true).when(
        (userMapList) {
          return RefreshIndicator(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: userMapList.length,
              separatorBuilder: (BuildContext context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return UserListDetailWidget(userMap: userMapList[index]);
              },
            ),
            onRefresh: () async {
              Provider.of<UserListPageNotifier>(context, listen: false).reload();
            },
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
