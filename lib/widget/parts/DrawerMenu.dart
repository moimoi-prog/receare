import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/state/friend_list_page/FriendListPageNotifier.dart';
import 'package:receare/state/reception_application_list_tab/ReceptionApplicationListTabNotifier.dart';
import 'package:receare/state/send_application_list_tab/SendApplicationListTabNotifier.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/page/friend_application_list_page/FriendApplicationListPage.dart';
import 'package:receare/widget/page/friend_list_page/FriendListPage.dart';
import 'package:receare/widget/page/user_detail_page/UserDetailPage.dart';



// --------------------------------
// クラス名 　: DrawerMenu
// クラス概要 : ドロワーメニュー
// --------------------------------
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
              // プロフィールページstateを更新
              Provider.of<UserDetailPageNotifier>(context, listen: false).reset();
              Provider.of<UserDetailPageNotifier>(context, listen: false).load(user.uid);

              // プロフィールページへ遷移
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
              // フレンドリストstateを更新
              Provider.of<FriendListPageNotifier>(context, listen: false).reload();

              // フレンドリストページへ遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FriendListPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('リクエスト'),
            onTap: () {
              // フレンドリクエストstateを更新
              Provider.of<SendApplicationListTabNotifier>(context, listen: false).reload();
              Provider.of<ReceptionApplicationListTabNotifier>(context, listen: false).reload();

              // フレンドリクエストタブへ遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
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

              // ログアウトする
              await signOutWithGoogle();
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: "ログアウトしました。");

              // ログインページへ遷移
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
