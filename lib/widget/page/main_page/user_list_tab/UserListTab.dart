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
    return Provider.of<UserListTabState>(context, listen: true).when(
      (userMapList) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ユーザー"),
          ),
          body: RefreshIndicator(
            child: userMapList.length > 0
                ? ListView.separated(
                    // ユーザーリストを表示
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: userMapList.length,
                    separatorBuilder: (BuildContext context, index) {
                      return Divider();
                    },
                    itemBuilder: (context, index) {
                      return UserListDetailWidget(userMap: userMapList[index]);
                    },
                  )
                : Center(
                    // シャウトが投稿されていない旨を表示
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("ユーザーが存在しません"),
                      ],
                    ),
                  ),
            onRefresh: () async {
              Provider.of<UserListTabNotifier>(context, listen: false).reload();
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
