import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/StickeyTabBar.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/page/shout_create_page/ShoutCreatePage.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailDataWidget.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailMessageWidget.dart';
import 'package:receare/widget/page/user_detail_page/UserShoutListWidget.dart';

// --------------------------------
// クラス名 　: UserDetailPage
// クラス概要 : ユーザー詳細画面
// --------------------------------
class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("プロフィール"), elevation: 0.0),
        body: StickyTabBar(
          tabHeader: [
            UserDetailDataWidget(),
            UserDetailMessageWidget(),
          ],
          tabBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.article_outlined)),
            ],
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
          ),
          tabBarView: TabBarView(
            children: [
              UserShoutListWidget(),
              // Text("2こ目"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () async {
            bool register = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ShoutCreatePage();
                },
              ),
            );

            // shoutを投稿した場合、更新処理を行う
            if (register != null && register) {
              Provider.of<UserDetailPageNotifier>(context, listen: false).reloadShout();
            }
          },
        ),
      ),
    );
  }
}
