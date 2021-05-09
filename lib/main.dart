import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/reception_application_list_page/ReceptionApplicationListTabNotifier.dart';
import 'package:receare/state/reception_application_list_page/ReceptionApplicationListTabState.dart';
import 'package:receare/state/send_application_list_page/SendApplicationListTabNotifier.dart';
import 'package:receare/state/send_application_list_page/SendApplicationListTabState.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/LoginPage.dart';
import 'package:receare/widget/MainPage.dart';
import 'package:receare/widget/SplashPage.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/state/comment_sender/CommentSenderState.dart';
import 'package:receare/state/friend_list_page/FriendListPageNotifier.dart';
import 'package:receare/state/friend_list_page/FriendListPageState.dart';
import 'package:receare/state/main_page/MainPageNotifier.dart';
import 'package:receare/state/main_page/MainPageState.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageState.dart';
import 'package:receare/state/shout_list_page/ShoutListPageNotifier.dart';
import 'package:receare/state/shout_list_page/ShoutListPageState.dart';
import 'package:receare/state/user_detail_page/UserDetailPageState.dart';
import 'package:receare/state/user_list_page/UserListPageNotifier.dart';
import 'package:receare/state/user_list_page/UserListPageState.dart';

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
        StateNotifierProvider<ShoutListPageNotifier, ShoutListPageState>(
          create: (context) => ShoutListPageNotifier(),
        ),
        StateNotifierProvider<UserDetailPageNotifier, UserDetailPageState>(
          create: (context) => UserDetailPageNotifier(),
        ),
        StateNotifierProvider<CommentSenderNotifier, CommentSenderState>(
          create: (context) => CommentSenderNotifier(),
        ),
        StateNotifierProvider<FriendListPageNotifier, FriendListPageState>(
          create: (context) => FriendListPageNotifier(),
        ),
        StateNotifierProvider<ShoutCreatePageNotifier, ShoutCreatePageState>(
          create: (context) => ShoutCreatePageNotifier(),
        ),
        StateNotifierProvider<UserListPageNotifier, UserListPageState>(
          create: (context) => UserListPageNotifier(),
        ),
        StateNotifierProvider<SendApplicationListTabNotifier, SendApplicationListTabState>(
          create: (context) => SendApplicationListTabNotifier(),
        ),
        StateNotifierProvider<ReceptionApplicationListTabNotifier, ReceptionApplicationListTabState>(
          create: (context) => ReceptionApplicationListTabNotifier(),
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
