// ------------------------------
// 処理概要　　: ユーザーを登録する
// 対象テーブル: users
// ------------------------------
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:receare/firebase/StorageModule.dart';

import '../strings.dart';
import 'AuthModule.dart';

// -----------------------------------
// Shoutを登録する
// -----------------------------------
Future<void> registerShout(
    {String detail = "", // 内容
      List<Asset> imageList = const [], // 画像一覧
      File video, // 動画
      List<String> tagList = const [] // タグ一覧
    }) async {
  try {
    // 現在の時刻を取得
    DateTime now = DateTime.now();

    // シャウトを登録
    Map<String, dynamic> shoutMap = {
      // Shoutを生成
      Strings.UID: user.uid,
      Strings.DETAIL: detail,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
    };

    DocumentReference shoutRef = await FirebaseFirestore.instance // Shoutを登録
        .collection(Strings.SHOUTS)
        .add(shoutMap);

    // シャウトに画像を登録
    for (Asset image in imageList) {
      // 画像をFirestorageにアップロード
      ByteData byteData = await image.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      String imagePath = await uploadShoutImage(imageData);

      Map<String, dynamic> imageMap = {
        // 画像マップを生成
        Strings.PATH: imagePath,
        Strings.CREATE: now,
        Strings.READ: now,
        Strings.UPDATE: now,
      };

      await FirebaseFirestore.instance // 画像マップをShoutに登録
          .collection(Strings.SHOUTS)
          .doc(shoutRef.id)
          .collection(Strings.IMAGE_PATH)
          .add(imageMap);
    }

    // シャウトとユーザーを紐付け
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
