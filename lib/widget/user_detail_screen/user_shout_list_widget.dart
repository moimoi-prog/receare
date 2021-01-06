import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_notifier.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_state.dart';
import 'package:receare/widget/parts/shout_list_detail_widget.dart';


// ----------------------------------------
// ユーザーシャウト表示画面
// ----------------------------------------
class UserShoutListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserDetailScreenState>(context, listen: true).when(
          (userDoc, shoutMapList) {
        return RefreshIndicator(
          onRefresh: () async {
            // Shoutを更新する
            Provider.of<UserDetailScreenNotifier>(context, listen: false).loadShout(userDoc.id);
          },
          child: ListView.separated(
            padding: EdgeInsets.only(top: 5.0),
            itemCount: shoutMapList.length,
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemBuilder: (context, index) => ShoutListDetailWidget(shoutMap: shoutMapList[index]),
          ),
        );
      },
      loading: () {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
