import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/ShoutModule.dart';
import 'package:receare/state/shout_create_screen/ShoutCreatePageNotifier.dart';
import 'package:receare/state/shout_create_screen/ShoutCreatePageState.dart';

// ----------------------------------
// シャウト作成画面
// ----------------------------------
class ShoutCreatePage extends StatelessWidget {
  final DocumentSnapshot document;

  ShoutCreatePage({Key key, this.document}) : super(key: key);

  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: Container(
                    child: TextFormField(
                      initialValue: Provider.of<ShoutCreatePageState>(context, listen: false).detail,
                      decoration: InputDecoration(hintText: "シャウトしよう！"),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        Provider.of<ShoutCreatePageNotifier>(context, listen: false).setDetail(value);
                      },
                    ),
                  ),
                ),
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
                // タグ入力欄
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ライブラリから選択
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
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: Provider.of<ShoutCreatePageNotifier>(context, listen: false).judge()
                            ? () async {
                          showLoadingDialog(context);
                          // Shoutを登録
                          await registerShout(
                            detail: Provider.of<ShoutCreatePageState>(context, listen: false).detail,
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
