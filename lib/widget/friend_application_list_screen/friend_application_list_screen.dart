import 'package:flutter/material.dart';
import 'package:receare/widget/friend_application_list_screen/reception_application_list_screen.dart';
import 'package:receare/widget/friend_application_list_screen/send_application_list_screen.dart';

// ----------------------------------------
// フレンドリクエスト画面
// ----------------------------------------
class FriendApplicationListScreen extends StatefulWidget {
  _FriendApplicationListScreenForm createState() => _FriendApplicationListScreenForm();
}

// ----------------------------------------
// メインステータス
// ----------------------------------------
class _FriendApplicationListScreenForm extends State<FriendApplicationListScreen> with SingleTickerProviderStateMixin {

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
                SendApplicationListScreen(),
                ReceptionApplicationListScreen()
              ]
          )
      ),
    );
  }
}
