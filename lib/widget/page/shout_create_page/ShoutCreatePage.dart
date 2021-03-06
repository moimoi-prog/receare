import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/ShoutModule.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageState.dart';

// --------------------------------
// クラス名 　: ShoutCreatePage
// クラス概要 : シャウト登録用
// --------------------------------
class ShoutCreatePage extends StatelessWidget {
  /* シャウトドキュメント(更新処理を行う際に使用) */ final DocumentSnapshot document;

  ShoutCreatePage({Key key, this.document}) : super(key: key);

  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // 引数があればシャウト投稿ページのstateを更新
    if (document != null) {
      Provider.of<ShoutCreatePageNotifier>(context, listen: false).setDoc(document);
    }

    // 処理中画面
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("シャウトする"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // 文章入力欄
                Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: Provider.of<ShoutCreatePageState>(context, listen: true).detailController,
                      decoration: InputDecoration(hintText: "シャウトしよう！"),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        if (value != null && value != "") {
                          Provider.of<ShoutCreatePageNotifier>(context, listen: false).setEnabled(true);
                        } else {
                          Provider.of<ShoutCreatePageNotifier>(context, listen: false).setEnabled(false);
                        }
                      },
                    ),
                  ),
                ),

                // 選択画像表示
                Container(
                  height: MediaQuery.of(context).size.width / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<ShoutCreatePageState>(context, listen: false).imageList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: AssetThumb(
                            asset: Provider.of<ShoutCreatePageState>(context, listen: false).imageList[index],
                            width: (MediaQuery.of(context).size.width / 4).floor(),
                            height: (MediaQuery.of(context).size.width / 4).floor(),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // 画像選択ボタン
                    IconButton(
                      icon: Icon(Icons.photo_library),
                      onPressed: () async {
                        List<Asset> imageList = await loadAssets(context);

                        if (imageList != null) {
                          Provider.of<ShoutCreatePageNotifier>(context, listen: false).setImage(imageList);
                          Fluttertoast.showToast(msg: "ライブラリから画像を選択しました。");
                        }
                      },
                    ),

                    // 送信ボタン
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: Provider.of<ShoutCreatePageState>(context, listen: true).enabled
                            ? () async {
                          showLoadingDialog(context);
                          // シャウトを登録
                          await registerShout(
                            detail: Provider.of<ShoutCreatePageState>(context, listen: false).detailController.text,
                            imageList: Provider.of<ShoutCreatePageState>(context, listen: false).imageList,
                            video: Provider.of<ShoutCreatePageState>(context, listen: false).video,
                            tagList: [],
                          );

                          Navigator.of(context).pop();
                          Navigator.of(context).pop(true);
                        }
                            : null),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------
  // メソッド名 : loadAssets
  // 処理概要　 : Assetsを読み込む
  // --------------------------------
  Future<List<Asset>> loadAssets(BuildContext context) async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: Provider.of<ShoutCreatePageState>(context, listen: false).imageList,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );

      return resultList;
    } on Exception catch (e) {
      return null;
    }
  }
}
