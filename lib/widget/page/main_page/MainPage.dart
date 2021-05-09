import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/main_page/MainPageState.dart';
import 'package:receare/widget/page/main_page/shout_list_tab/ShoutListTab.dart';
import 'package:receare/widget/page/main_page/user_list_tab/UserListTab.dart';
import 'package:receare/widget/parts/DrawerMenu.dart';

// --------------------------------
// クラス名 　: MainPage
// クラス概要 : メインページ
// --------------------------------
class MainPage extends StatefulWidget {
  _MainForm createState() => _MainForm();
}

// --------------------------------
// クラス名 　: _MainForm
// クラス概要 : メインページフォーム
// --------------------------------
class _MainForm extends State<MainPage> {
  // 変数を宣言
  /* タブインデックス */ int _selectedIndex = 0;
  /* コントローラー　 */ PageController _pageController;

  // --------------------------------
  // メソッド名 : _onPageChanged
  // 処理概要　 : タブを切り替える
  // --------------------------------
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Provider.of<MainPageState>(context, listen: false).when(
        (myEventTabIndex) {
          return Scaffold(
            drawer: DrawerMenu(),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                // フレンドシャウトリスト
                ShoutListTab(),

                // ユーザーリスト
                UserListTab(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedIndex,
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined),
                  title: Text("シャウト"),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined),
                  title: Text("ユーザー"),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
