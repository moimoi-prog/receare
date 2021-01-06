import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_list_screen/user_list_screen_state.dart';
import 'package:receare/widget/parts/user_list_detail_widget.dart';

import '../../strings.dart';

// ----------------------------------------
// ユーザー一覧タブ
// ----------------------------------------
class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
      ),
      body: Provider.of<UserListScreenState>(context, listen: true).when(
        (userMapList) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: userMapList.length,
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              DocumentSnapshot userDoc = userMapList[index][Strings.USER];

              return UserListDetailWidget(userMap: userMapList[index]);
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
