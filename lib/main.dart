import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/reception_application_list_screen/ReceptionApplicationListPageNotifier.dart';
import 'package:receare/state/reception_application_list_screen/ReceptionApplicationListPageState.dart';
import 'package:receare/state/send_application_list_screen/SendApplicationListPageNotifier.dart';
import 'package:receare/state/send_application_list_screen/SendApplicationListPageState.dart';
import 'package:receare/state/user_detail_screen/UserDetailPageNotifier.dart';
import 'package:receare/widget/LoginPage.dart';
import 'package:receare/widget/MainPage.dart';
import 'package:receare/widget/SplashPage.dart';
import 'package:receare/state/comment_sender/CommentSenderNotifier.dart';
import 'package:receare/state/comment_sender/CommentSenderState.dart';
import 'package:receare/state/friend_list_screen/FriendListPageNotifier.dart';
import 'package:receare/state/friend_list_screen/FriendListPageState.dart';
import 'package:receare/state/main_screen/MainPageNotifier.dart';
import 'package:receare/state/main_screen/MainPageState.dart';
import 'package:receare/state/shout_create_screen/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_create_screen/ShoutCreatePageState.dart';
import 'package:receare/state/shout_list_screen/ShoutListPageNotifier.dart';
import 'package:receare/state/shout_list_screen/ShoutListPageState.dart';
import 'package:receare/state/user_detail_screen/UserDetailPageState.dart';
import 'package:receare/state/user_list_screen/UserListPageNotifier.dart';
import 'package:receare/state/user_list_screen/UserListPageState.dart';

// --------------------------------
// mainメソッド
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
        StateNotifierProvider<SendApplicationListPageNotifier, SendApplicationListPageState>(
          create: (context) => SendApplicationListPageNotifier(),
        ),
        StateNotifierProvider<ReceptionApplicationListPageNotifier, ReceptionApplicationListPageState>(
          create: (context) => ReceptionApplicationListPageNotifier(),
        ),
      ],
    ),
  );
}

// --------------------------------
// アプリメイン画面
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
