import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/CameraModule.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/common/LoadingDialog.dart';
import 'package:receare/firebase/UserModule.dart';
import 'package:receare/state/user_detail_screen/UserDetailPageNotifier.dart';
import 'package:receare/widget/parts/HeaderImageCropPage.dart';
import 'package:receare/widget/parts/IconImageCropPage.dart';
import 'package:receare/widget/parts/UserImageWidget.dart';

import '../../strings.dart';

// --------------------------------
// ユーザー情報変更画面
// --------------------------------
class UserUpdatePage extends StatefulWidget {
  /* Userドキュメント */ final DocumentSnapshot userDoc;

  const UserUpdatePage({Key key, this.userDoc})
      : assert(userDoc != null),
        super(key: key);

  _UserUpdatePageState createState() => _UserUpdatePageState();
}

// ----------------------------------------
// ユーザー情報変更ステータス
// ----------------------------------------
class _UserUpdatePageState extends State<UserUpdatePage> {
  /* 画面の横 */
  double width;

  TextEditingController nameController;
  TextEditingController profileController;
  File profileImage;
  File backgroundImage;

  bool profileImageFlag = false;
  bool backgroundImageFlag = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.userDoc.data()[Strings.NAME]);
    profileController = TextEditingController(text: widget.userDoc.data()[Strings.MESSAGE]);
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
                    // 大きさ調整するやつ
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
                        : registeredKey(widget.userDoc, Strings.HEADER_IMAGE_PATH)
                        ? Container(
                      width: width,
                      height: width / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            widget.userDoc.data()[Strings.HEADER_IMAGE_PATH],
                          ),
                        ),
                      ),
                    )
                        : Container(
                      width: width,
                      height: width / 3,
                      color: Colors.grey,
                    ),
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

                    // ユーザーイメージ

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
                            : registeredKey(widget.userDoc, Strings.ICON_IMAGE_PATH)
                            ? ClipOval(
                          child: UserImageWidgetFromPath(
                            path: widget.userDoc[Strings.ICON_IMAGE_PATH],
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
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "名前"),
                  ),
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
                    await updateUser(
                      uid: widget.userDoc.id,
                      name: nameController.text,
                      message: profileController.text,
                      iconImage: profileImageFlag ? profileImage : null,
                      headerImage: backgroundImageFlag ? backgroundImage : null,
                    );

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
