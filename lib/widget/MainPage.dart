import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/main_screen/MainPageState.dart';
import 'package:receare/widget/parts/DrawerMenu.dart';
import 'package:receare/widget/shout_list_page/ShoutListPage.dart';
import 'package:receare/widget/user_list_page/UserListPage.dart';

// ----------------------------------------
// メインページ
// ----------------------------------------
class MainPage extends StatefulWidget {
  _MainForm createState() => _MainForm();
}

// ----------------------------------------
// メインステータス
// ----------------------------------------
class _MainForm extends State<MainPage> {
  // 変数を宣言
  /* タブインデックス */
  int _selectedIndex = 0;

  int _myEventTabIndex = 0;

  /* コントローラー　 */
  PageController _pageController;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void myEventTabChange(int index) {
    _myEventTabIndex = index;
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
                ShoutListPage(),
                UserListPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              // backgroundColor: Colors.black,
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
