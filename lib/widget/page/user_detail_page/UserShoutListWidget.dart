import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/state/user_detail_page/UserDetailPageState.dart';
import 'package:receare/widget/parts/shout_list_detail_widget/ShoutListDetailWidget.dart';

// --------------------------------
// クラス名 　: UserShoutListWidget
// クラス概要 : ユーザーシャウト一覧ページ
// --------------------------------
class UserShoutListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserDetailPageState>(context, listen: true).when(
      (userDoc, shoutDataList) {
        return RefreshIndicator(
          onRefresh: () async {
            // シャウトを更新する
            Provider.of<UserDetailPageNotifier>(context, listen: false).loadShout(userDoc.id);
          },
          child: shoutDataList.length > 0
              ? ListView.separated( // シャウト一覧を表示
                  padding: EdgeInsets.only(top: 5.0),
                  itemCount: shoutDataList.length,
                  separatorBuilder: (BuildContext context, index) {
                    return Divider();
                  },
                  itemBuilder: (context, index) => ShoutListDetailWidget(
                    sd: shoutDataList[index],
                  ),
                )
              : Center( // シャウトが投稿されていない旨を表示
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("シャウトをまだ投稿していません。"),
                      Text("投稿してみましょう!"),
                    ],
                  ),
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
