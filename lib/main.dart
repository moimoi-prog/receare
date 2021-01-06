import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/reception_application_list_screen/reception_application_list_screen_notifier.dart';
import 'package:receare/state/reception_application_list_screen/reception_application_list_screen_state.dart';
import 'package:receare/state/send_application_list_screen/send_application_list_screen_notifier.dart';
import 'package:receare/state/send_application_list_screen/send_application_list_screen_state.dart';
import 'package:receare/widget/login_screen.dart';
import 'package:receare/widget/main_screen.dart';
import 'package:receare/widget/splash_screen.dart';
import 'package:receare/state/comment_sender/comment_sender_notifier.dart';
import 'package:receare/state/comment_sender/comment_sender_state.dart';
import 'package:receare/state/friend_list_screen/friend_list_screen_notifier.dart';
import 'package:receare/state/friend_list_screen/friend_list_screen_state.dart';
import 'package:receare/state/main_screen/main_screen_notifier.dart';
import 'package:receare/state/main_screen/main_screen_state.dart';
import 'package:receare/state/shout_create_screen/shout_create_screen_notifier.dart';
import 'package:receare/state/shout_create_screen/shout_create_screen_state.dart';
import 'package:receare/state/shout_list_screen/shout_list_screen_notifier.dart';
import 'package:receare/state/shout_list_screen/shout_list_screen_state.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_notifier.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_state.dart';
import 'package:receare/state/user_list_screen/user_list_screen_notifier.dart';
import 'package:receare/state/user_list_screen/user_list_screen_state.dart';

// --------------------------------
// mainメソッド
// --------------------------------
void main() {
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        StateNotifierProvider<MainScreenNotifier, MainScreenState>(
          create: (context) => MainScreenNotifier(),
        ),
        StateNotifierProvider<ShoutListScreenNotifier, ShoutListScreenState>(
          create: (context) => ShoutListScreenNotifier(),
        ),
        StateNotifierProvider<UserDetailScreenNotifier, UserDetailScreenState>(
          create: (context) => UserDetailScreenNotifier(),
        ),
        StateNotifierProvider<CommentSenderNotifier, CommentSenderState>(
          create: (context) => CommentSenderNotifier(),
        ),
        StateNotifierProvider<FriendListScreenNotifier, FriendListScreenState>(
          create: (context) => FriendListScreenNotifier(),
        ),
        StateNotifierProvider<ShoutCreateScreenNotifier, ShoutCreateScreenState>(
          create: (context) => ShoutCreateScreenNotifier(),
        ),
        StateNotifierProvider<UserListScreenNotifier, UserListScreenState>(
          create: (context) => UserListScreenNotifier(),
        ),
        StateNotifierProvider<SendApplicationListScreenNotifier, SendApplicationListScreenState>(
          create: (context) => SendApplicationListScreenNotifier(),
        ),
        StateNotifierProvider<ReceptionApplicationListScreenNotifier, ReceptionApplicationListScreenState>(
          create: (context) => ReceptionApplicationListScreenNotifier(),
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
