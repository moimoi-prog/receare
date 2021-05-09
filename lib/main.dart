import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/reception_application_list_tab/ReceptionApplicationListTabNotifier.dart';
import 'package:receare/state/reception_application_list_tab/ReceptionApplicationListTabState.dart';
import 'package:receare/state/send_application_list_tab/SendApplicationListTabNotifier.dart';
import 'package:receare/state/send_application_list_tab/SendApplicationListTabState.dart';
import 'package:receare/state/shout_list_tab/ShoutListTabNotifier.dart';
import 'package:receare/state/shout_list_tab/ShoutListTabState.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/state/user_list_tab/UserListTabNotifier.dart';
import 'package:receare/state/user_list_tab/UserListTabState.dart';
import 'package:receare/widget/page/LoginPage.dart';
import 'package:receare/widget/page/SplashPage.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/state/comment_sender/CommentSenderState.dart';
import 'package:receare/state/friend_list_page/FriendListPageNotifier.dart';
import 'package:receare/state/friend_list_page/FriendListPageState.dart';
import 'package:receare/state/main_page/MainPageNotifier.dart';
import 'package:receare/state/main_page/MainPageState.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageState.dart';
import 'package:receare/state/user_detail_page/UserDetailPageState.dart';
import 'package:receare/widget/page/main_page/MainPage.dart';

// --------------------------------
// メソッド名 : main
// 処理概要　 : メインメソッド
// --------------------------------
void main() {
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        StateNotifierProvider<MainPageNotifier, MainPageState>(
          create: (context) => MainPageNotifier(),
        ),
        StateNotifierProvider<ShoutListTabNotifier, ShoutListTabState>(
          create: (context) => ShoutListTabNotifier(),
        ),
        StateNotifierProvider<UserListTabNotifier, UserListTabState>(
          create: (context) => UserListTabNotifier(),
        ),
        StateNotifierProvider<FriendListPageNotifier, FriendListPageState>(
          create: (context) => FriendListPageNotifier(),
        ),
        StateNotifierProvider<SendApplicationListTabNotifier, SendApplicationListTabState>(
          create: (context) => SendApplicationListTabNotifier(),
        ),
        StateNotifierProvider<ReceptionApplicationListTabNotifier, ReceptionApplicationListTabState>(
          create: (context) => ReceptionApplicationListTabNotifier(),
        ),
        StateNotifierProvider<ShoutCreatePageNotifier, ShoutCreatePageState>(
          create: (context) => ShoutCreatePageNotifier(),
        ),
        StateNotifierProvider<UserDetailPageNotifier, UserDetailPageState>(
          create: (context) => UserDetailPageNotifier(),
        ),
        StateNotifierProvider<CommentSenderNotifier, CommentSenderState>(
          create: (context) => CommentSenderNotifier(),
        ),
      ],
    ),
  );
}

// --------------------------------
// クラス名 　: MyApp
// クラス概要 : 親画面クラス
// --------------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        title: 'receare',
        theme: ThemeData(
          brightness: Brightness.dark,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        routes: <String, WidgetBuilder>{
          "/": (_) => SplashPage(),
          "/login": (_) => LoginPage(),
          "/main": (_) => MainPage(),
        },
      ),
    );
  }
}


// --------------------------------
// クラス名 　:
// クラス概要 :
// --------------------------------
// --------------------------------
// メソッド名 :
// 処理概要　 :
// --------------------------------
