import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:receare/firebase/StorageModule.dart';

import '../Strings.dart';
import 'AuthModule.dart';

// --------------------------------
// メソッド名 : registerShout
// 処理概要　 : シャウトを登録する
// --------------------------------
Future<void> registerShout({String detail = "", // 内容
  List<Asset> imageList = const [], // 画像一覧
  File video, // 動画
  List<String> tagList = const [] // タグ一覧
}) async {
  try {
    // 現在の時刻を取得
    DateTime now = DateTime.now();

    /** シャウトを登録 */
    // シャウトマップを生成
    Map<String, dynamic> shoutMap = {
      Strings.UID: user.uid,
      Strings.DETAIL: detail,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
    };

    // DBに登録
    DocumentReference shoutRef = await FirebaseFirestore.instance // Shoutを登録
        .collection(Strings.SHOUTS)
        .add(shoutMap);

    /** シャウトに画像を登録 */
    for (int i = 0; i < imageList.length - 1; i++) {
      Asset image = imageList[i];

      // 画像をFirestorageにアップロード
      ByteData byteData = await image.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      String imagePath = await uploadShoutImage(imageData);

      // 画像マップを生成
      Map<String, dynamic> imageMap = {
        // 画像マップを生成
        Strings.PATH: imagePath,
        Strings.INDEX: i,
        Strings.CREATE: now,
        Strings.READ: now,
        Strings.UPDATE: now,
      };

      // シャウトに画像を登録
      await FirebaseFirestore.instance // 画像マップをShoutに登録
          .collection(Strings.SHOUTS)
          .doc(shoutRef.id)
          .collection(Strings.IMAGE_PATH)
          .add(imageMap);
    }

    // シャウトとユーザ
    Map<String, dynamic> userShoutMap = {
      // Shoutを生成
      Strings.ID: shoutRef.id,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
    };

    await FirebaseFirestore.instance
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.SHOUTS)
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
      .collection(Strings.USERS)
      .doc(user.uid)
      .collection(Strings.SHOUTS)
      .doc(shoutId)
      .delete();

  // シャウトを削除
  await FirebaseFirestore.instance
      .collection(Strings.SHOUTS)
      .doc(shoutId)
      .delete();
}
