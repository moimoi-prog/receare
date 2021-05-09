import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_list_tab/UserListTabNotifier.dart';
import 'package:receare/state/user_list_tab/UserListTabState.dart';
import 'package:receare/widget/parts/UserListDetailWidget.dart';


// --------------------------------
// クラス名 　: UserListTab
// クラス概要 : ユーザー一覧タブ
// --------------------------------
class UserListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザー"),
      ),
      body: Provider.of<UserListTabState>(context, listen: true).when(
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
              Provider.of<UserListTabNotifier>(context, listen: false).reload();
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
