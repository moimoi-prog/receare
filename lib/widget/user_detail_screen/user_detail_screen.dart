import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/StickeyTabBar.dart';
import 'package:receare/widget/shout_create_screen/shout_create_screen.dart';
import 'package:receare/widget/user_detail_screen/user_detail_data_widget.dart';
import 'package:receare/widget/user_detail_screen/user_detail_message_widget.dart';
import 'package:receare/widget/user_detail_screen/user_shout_list_widget.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_notifier.dart';


// ----------------------------------------
// ユーザー詳細画面
// ----------------------------------------
class UserDetailScreen extends StatelessWidget {
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
              // Tab(icon: Icon(Icons.flag)),
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
                  return ShoutCreateScreen();
                },
              ),
            );

            // shoutを投稿した場合、更新処理を行う
            if (register != null && register) {
              Provider.of<UserDetailScreenNotifier>(context, listen: false).reloadShout();
            }
          },
        ),
      ),
    );
  }
}
