import 'package:flutter/material.dart';
import 'package:receare/widget/friend_application_list_page/ReceptionApplicationListTab.dart';
import 'package:receare/widget/friend_application_list_page/SendApplicationListTab.dart';

// --------------------------------
// クラス名 　: FriendApplicationListPage
// クラス概要 : フレンドリクエスト管理画面
// --------------------------------
class FriendApplicationListPage extends StatefulWidget {
  _FriendApplicationListPageForm createState() => _FriendApplicationListPageForm();
}

// --------------------------------
// クラス名 　: _FriendApplicationListPageForm
// クラス概要 : フレンドリクエスト管理画面ステータス
// --------------------------------
class _FriendApplicationListPageForm extends State<FriendApplicationListPage> with SingleTickerProviderStateMixin {

  final List<Tab> tabs = <Tab>[
    Tab(text: "送信中"),
    Tab(text: '受信中'),
  ];

  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("フレンド管理"),
            bottom: TabBar(
              tabs: tabs,
              controller: _tabController,
            ),
          ),
          body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                SendApplicationListPage(),
                ReceptionApplicationListPage()
              ]
          )
      ),
    );
  }
}
