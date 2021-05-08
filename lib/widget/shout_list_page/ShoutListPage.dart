import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/state/shout_create_screen/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_list_screen/ShoutListPageNotifier.dart';
import 'package:receare/state/shout_list_screen/ShoutListPageState.dart';
import 'package:receare/widget/parts/shout_list_detail/ShoutListDetailWidget.dart';
import 'package:receare/widget/shout_create_page/ShoutCreatePage.dart';

// ----------------------------------------
// シャウト一覧画面
// ----------------------------------------
class ShoutListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ShoutListPageState>(context, listen: true).when((shoutMapList) {
      return Scaffold(
        appBar: AppBar(
          title: Text("shout"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // Shoutを更新する
            Provider.of<ShoutListPageNotifier>(context, listen: false).reload();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemCount: shoutMapList.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> shoutMap = shoutMapList[index];

              return ShoutListDetailWidget(
                shoutMap: shoutMap,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () async {
            Provider.of<ShoutCreatePageNotifier>(context, listen: false).reset();

            bool register = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ShoutCreatePage();
                },
              ),
            );

            // shoutを投稿した場合、更新処理を行う
            if (register != null && register) {
              Provider.of<ShoutListPageNotifier>(context, listen: false).reload();
            }
          },
        ),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
