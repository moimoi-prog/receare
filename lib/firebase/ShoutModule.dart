import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:receare/firebase/StorageModule.dart';

import '../Const.dart';
import 'AuthModule.dart';

// --------------------------------
// メソッド名 : registerShout
// 処理概要　 : シャウトを登録する
// --------------------------------
Future<void> registerShout({String detail = "",
  List<Asset> imageList = const [],
  File video,
  List<String> tagList = const [],
}) async {
  try {
    // 現在の時刻を取得
    DateTime now = DateTime.now();

    // シャウトに登録するデータを生成
    Map<String, dynamic> shoutMap = {
      Const.UID: user.uid,
      Const.DETAIL: detail,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // シャウトデータを登録
    DocumentReference shoutRef = await FirebaseFirestore.instance // Shoutを登録
        .collection(Const.SHOUTS)
        .add(shoutMap);

    // シャウトに画像を登録
    for (int i = 0; i < imageList.length; i++) {
      // 画像インスタンスを生成
      Asset image = imageList[i];

      // 画像をFirestorageにアップロード
      ByteData byteData = await image.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      String imagePath = await uploadShoutImage(imageData);

      // 画像マップを生成
      Map<String, dynamic> imageMap = {
        Const.PATH: imagePath,
        Const.INDEX: i,
        Const.CREATE: now,
        Const.READ: null,
        Const.UPDATE: now,
        Const.DELETE: null,
      };

      // シャウトに画像を登録
      await FirebaseFirestore.instance // 画像マップをShoutに登録
          .collection(Const.SHOUTS)
          .doc(shoutRef.id)
          .collection(Const.IMAGE_PATH)
          .add(imageMap);
    }

    // シャウトとコメントを紐づけるデータを生成
    Map<String, dynamic> userShoutMap = {
      Const.ID: shoutRef.id,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // シャウトとコメントの紐付けデータを登録
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.SHOUTS)
        .add(userShoutMap);

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// --------------------------------
// メソッド名 : deleteShout
// 処理概要　 : シャウトを削除する
// --------------------------------
Future<void> deleteShout({String uid, String shoutId}) async {

  if (uid == null) {
    uid = user.uid;
  }

  // ユーザーとシャウトの紐付けを削除
  await FirebaseFirestore.instance
      .collection(Const.USERS)
      .doc(user.uid)
      .collection(Const.SHOUTS)
      .doc(shoutId)
      .delete();

  // シャウトを削除
  await FirebaseFirestore.instance
      .collection(Const.SHOUTS)
      .doc(shoutId)
      .delete();
}
