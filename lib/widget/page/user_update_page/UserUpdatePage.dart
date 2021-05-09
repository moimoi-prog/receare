import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:receare/Const.dart';
import 'package:receare/common/CameraModule.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/UserModule.dart';
import 'package:receare/state/user_detail_page/UserDetailPageNotifier.dart';
import 'package:receare/widget/page/header_image_crop_page/HeaderImageCropPage.dart';
import 'package:receare/widget/page/icon_image_crop_page/IconImageCropPage.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';

// --------------------------------
// クラス名 　: UserUpdatePage
// クラス概要 : ユーザー情報変更画面
// --------------------------------
class UserUpdatePage extends StatefulWidget {
  /* Userドキュメント */ final DocumentSnapshot userDoc;

  const UserUpdatePage({Key key, this.userDoc})
      : assert(userDoc != null),
        super(key: key);

  _UserUpdatePageState createState() => _UserUpdatePageState();
}

// --------------------------------
// クラス名 　: _UserUpdatePageState
// クラス概要 : ユーザー情報変更画面ステータス
// --------------------------------
class _UserUpdatePageState extends State<UserUpdatePage> {
  /* 画面の横幅 */
  double width;

  /* 名前入力欄コントローラー 　　*/ TextEditingController nameController;
  /* 自己紹介入力欄コントローラー */ TextEditingController profileController;
  /* アイコン画像 　　　　　　　　*/ File profileImage;
  /* 背景画像　　　　　　　　　　 */ File backgroundImage;

  bool profileImageFlag = false;
  bool backgroundImageFlag = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.userDoc.data()[Const.NAME]);
    profileController = TextEditingController(text: widget.userDoc.data()[Const.MESSAGE]);
  }

  @override
  Widget build(BuildContext context) {
    /* 画面の横 */
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("編集"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: width,
                      height: (width / 3) + (width / 8) + 5,
                    ),

                    // 背景画像
                    backgroundImage != null
                        ? Container(
                      width: width,
                      height: width / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.fill, image: FileImage(backgroundImage)),
                      ),
                    )
                        : registeredKey(widget.userDoc, Const.HEADER_IMAGE_PATH)
                        ? Container(
                      width: width,
                      height: width / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.userDoc.data()[Const.HEADER_IMAGE_PATH],
                          ),
                        ),
                      ),
                    )
                        : Container(
                      width: width,
                      height: width / 3,
                      color: Colors.grey,
                    ),

                    // 背景画像選択ページ遷移ボタン
                    Positioned(
                      right: 5,
                      top: (width / 3) - (width / 8) - 5,
                      child: IconButton(
                        onPressed: () async {
                          File image = await getAndSaveImageFromDevice(ImageSource.gallery);
                          File croppedImage;
                          if (image != null) {
                            croppedImage = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return HeaderImageCropPage(image: image);
                                },
                              ),
                            );
                          }

                          if (croppedImage != null) {
                            setState(() {
                              backgroundImage = croppedImage;
                              backgroundImageFlag = true;
                            });
                          }
                        },
                        iconSize: 25,
                        icon: Icon(Icons.photo_library_outlined),
                      ),
                    ),

                    // アイコン画像枠
                    Positioned(
                      left: (width / 2) - (width / 8) - 5,
                      top: (width / 3) - (width / 8) - 5,
                      child: ClipOval(
                        child: Container(
                          width: width / 4 + 10,
                          height: width / 4 + 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),

                    // アイコン画像
                    Positioned(
                      left: (width / 2) - (width / 8),
                      top: (width / 3) - (width / 8),
                      child: ClipOval(
                        child: profileImage != null
                            ? Container(
                          width: width / 4,
                          height: width / 4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(profileImage),
                            ),
                          ),
                        )
                            : registeredKey(widget.userDoc, Const.ICON_IMAGE_PATH)
                            ? ClipOval(
                          child: UserImageWidget(
                            uid : widget.userDoc.id,
                            radius: width / 4,
                            color: Colors.grey,
                          ),
                        )
                            : Container(
                          width: width / 4,
                          height: width / 4,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    // アイコン画像選択ページ遷移ボタン
                    Positioned(
                      left: (width / 2) - (width / 8) + (width / 8) - 25,
                      top: (width / 3) - (width / 8) + (width / 8) - 25,
                      child: IconButton(
                        onPressed: () async {
                          File image = await getAndSaveImageFromDevice(ImageSource.gallery);
                          File croppedImage;
                          if (image != null) {
                            croppedImage = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return IconImageCropPage(image: image);
                                },
                              ),
                            );
                          }

                          if (croppedImage != null) {
                            setState(() {
                              profileImage = croppedImage;
                              profileImageFlag = true;
                            });
                          }
                        },
                        iconSize: 25,
                        icon: Icon(Icons.photo_library_outlined),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 名前入力欄
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "名前"),
                  ),

                  // 自己紹介入力欄
                  TextFormField(
                    controller: profileController,
                    decoration: InputDecoration(labelText: "自己紹介"),
                    maxLength: 150,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("確定"),
                  color: Colors.blue,
                  shape: StadiumBorder(),
                  onPressed: () async {
                    showLoadingDialog(context);

                    // ユーザー情報更新
                    await updateUser(
                      uid: widget.userDoc.id,
                      name: nameController.text,
                      message: profileController.text,
                      iconImage: profileImageFlag ? profileImage : null,
                      headerImage: backgroundImageFlag ? backgroundImage : null,
                    );

                    // ユーザー情報際読み込み
                    await Provider.of<UserDetailPageNotifier>(context, listen: false).loadUser(widget.userDoc.id);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
