import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/friend_list_screen/friend_list_screen_notifier.dart';
import 'package:receare/state/friend_list_screen/friend_list_screen_state.dart';
import 'package:receare/widget/parts/user_list_detail_widget.dart';


// ----------------------------------------
// フレンド一覧タブ
// ----------------------------------------
class FriendListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("friend"),
      ),
      body: Provider.of<FriendListScreenState>(context, listen: true).when(
            (friendMapList) {
          if (friendMapList.length == 0) {
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text("フレンドがいません"),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              // Shoutを更新する
              Provider.of<FriendListScreenNotifier>(context, listen: false).reload();
            },
            child: ListView.separated(
              padding: EdgeInsets.only(right: 5.0, left: 5.0),
              separatorBuilder: (BuildContext context, index) {
                return Divider();
              },
              itemCount: friendMapList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> friendMap = friendMapList[index];

                return UserListDetailWidget(userMap: friendMap);
              },
            ),
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
