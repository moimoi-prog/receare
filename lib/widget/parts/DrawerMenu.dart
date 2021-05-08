import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/state/friend_list_screen/FriendListPageNotifier.dart';
import 'package:receare/state/reception_application_list_screen/ReceptionApplicationListPageNotifier.dart';
import 'package:receare/state/send_application_list_screen/SendApplicationListPageNotifier.dart';
import 'package:receare/state/user_detail_screen/UserDetailPageNotifier.dart';
import 'package:receare/widget/friend_application_list_page/FriendApplicationListPage.dart';
import 'package:receare/widget/friend_list_page/FriendListPage.dart';
import 'package:receare/widget/user_detail_page/UserDetailPage.dart';


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
              Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
              Provider.of<UserDetailPageNotifier>(context, listen: false).load(user.uid);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UserDetailPage();
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
                    Provider.of<FriendListPageNotifier>(context, listen: false).reload();
                    return FriendListPage();
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
                    Provider.of<SendApplicationListPageNotifier>(context, listen: false).reload();
                    Provider.of<ReceptionApplicationListPageNotifier>(context, listen: false).reload();
                    return FriendApplicationListPage();
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