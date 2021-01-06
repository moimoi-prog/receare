import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/loading_dialog.dart';
import 'package:receare/firebase/auth_module.dart';
import 'package:receare/state/friend_list_screen/friend_list_screen_notifier.dart';
import 'package:receare/state/reception_application_list_screen/reception_application_list_screen_notifier.dart';
import 'package:receare/state/send_application_list_screen/send_application_list_screen_notifier.dart';
import 'package:receare/widget/friend_application_list_screen/friend_application_list_screen.dart';
import 'package:receare/widget/friend_list_screen/friend_list_screen.dart';
import 'package:receare/widget/user_detail_screen/user_detail_screen.dart';
import 'package:receare/state/user_detail_screen/user_detail_screen_notifier.dart';


// ----------------------------------------
// メニュー(左横をスライドすると出てくるメニュー)
// ----------------------------------------
class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'メニュー',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('マイページ'),
            onTap: () {
              Provider.of<UserDetailScreenNotifier>(context, listen: false).reset();
              Provider.of<UserDetailScreenNotifier>(context, listen: false).load(user.uid);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UserDetailScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('フレンド'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    Provider.of<FriendListScreenNotifier>(context, listen: false).reload();
                    return FriendListScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('リクエスト'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    Provider.of<SendApplicationListScreenNotifier>(context, listen: false).reload();
                    Provider.of<ReceptionApplicationListScreenNotifier>(context, listen: false).reload();
                    return FriendApplicationListScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('ログアウト'),
            onTap: () async {
              showLoadingDialog(context);
              await signOutWithGoogle();
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: "ログアウトしました。");
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
