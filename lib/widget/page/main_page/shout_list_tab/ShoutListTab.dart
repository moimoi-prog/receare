import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/data/ShoutData.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_list_tab/ShoutListTabNotifier.dart';
import 'package:receare/state/shout_list_tab/ShoutListTabState.dart';
import 'package:receare/widget/page/shout_create_page/ShoutCreatePage.dart';
import 'package:receare/widget/parts/shout_list_detail_widget/ShoutListDetailWidget.dart';

// --------------------------------
// クラス名 　: ShoutListTab
// クラス概要 : シャウト一覧タブ
// --------------------------------
class ShoutListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ShoutListTabState>(context, listen: true).when(
      (shoutDataList) {
        return Scaffold(
          appBar: AppBar(
            title: Text("シャウト"),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              // Shoutを更新する
              Provider.of<ShoutListTabNotifier>(context, listen: false).reload();
            },
            child: shoutDataList.length > 0 ? ListView.separated(
              padding: EdgeInsets.only(right: 5.0, left: 5.0),
              separatorBuilder: (BuildContext context, index) {
                return Divider();
              },
              itemCount: shoutDataList.length,
              itemBuilder: (context, index) {
                ShoutData sd = shoutDataList[index];

                return ShoutListDetailWidget(
                  sd: sd,
                );
              },
            ) : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("シャウトがまだ投稿されていません。"),
                  Text("投稿してみましょう!"),
                ],
              ),
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
                Provider.of<ShoutListTabNotifier>(context, listen: false).reload();
              }
            },
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
