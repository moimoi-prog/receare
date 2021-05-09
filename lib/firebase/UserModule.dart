import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:receare/firebase/StorageModule.dart';

import '../Strings.dart';

// --------------------------------
// メソッド名 : registerUser
// 処理概要　 : ユーザーを登録する
// --------------------------------
Future<void> registerUser(String name, String uid, String email) async {
  try {
    DateTime now = DateTime.now();

    // 登録データを生成
    Map<String, dynamic> map = {
      Strings.UID: uid,
      Strings.NAME: name,
      Strings.MAIL: email,
      Strings.MESSAGE: "",
      Strings.ICON_IMAGE_PATH: "",
      Strings.HEADER_IMAGE_PATH: "",
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
      Strings.DELETE: now,
    };

    await FirebaseFirestore.instance // ユーザーを登録
        .collection(Strings.USERS)
        .doc(uid)
        .set(map);
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// --------------------------------
// メソッド名 : updateUser
// 処理概要　 : ユーザーを更新する
// --------------------------------
Future<void> updateUser({
  String name,
  String uid,
  String email,
  String message,
  File iconImage,
  File headerImage,
}) async {
  try {
    DateTime now = DateTime.now();

    // 登録データを生成
    Map<String, dynamic> map = {};

    map.addAll({Strings.UPDATE: now});

    if (name != null) {
      map.addAll({Strings.NAME: name});
    }

    if (uid != null) {
      map.addAll({Strings.UID: uid});
    }

    if (email != null) {
      map.addAll({Strings.MAIL: email});
    }

    if (message != null) {
      map.addAll({Strings.MESSAGE: message});
    }

    if (iconImage != null) {
      // 画像アップロードする
      String iconImagePath = await uploadImage(iconImage);

      map.addAll({Strings.ICON_IMAGE_PATH: iconImagePath});
    }

    if (headerImage != null) {
      // 画像をアップロードする
      String headerImagePath = await uploadImage(headerImage);

      map.addAll({Strings.HEADER_IMAGE_PATH: headerImagePath});
    }

    await FirebaseFirestore.instance // ユーザーを登録
        .collection(Strings.USERS)
        .doc(uid)
        .update(map);
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// --------------------------------
// メソッド名 : sendFriendRequest
// 処理概要　 : フレンドリクエストを送信する
// --------------------------------
Future<void> sendFriendRequest(
    String sendUid, // 送信元ID
    String distUid, // 宛先ID
    ) async {
  try {
    DateTime now = DateTime.now();

    // 送信元に登録するデータを生成
    Map<String, dynamic> sendMap = {
      Strings.UID: distUid,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
      Strings.DELETE: now,
    };

    // 宛先に登録するデータを生成
    Map<String, dynamic> distMap = {
      Strings.UID: sendUid,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
      Strings.DELETE: now,
    };

    await FirebaseFirestore.instance // 送信元を登録
        .collection(Strings.USERS)
        .doc(sendUid)
        .collection(Strings.SEND_APPLICATIONS)
        .doc(distUid)
        .set(sendMap);

    await FirebaseFirestore.instance // 宛先にデータを登録
        .collection(Strings.USERS)
        .doc(distUid)
        .collection(Strings.RECEPTION_APPLICATIONS)
        .doc(sendUid)
        .set(distMap);
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// --------------------------------
// メソッド名 : apploveFriendRequest
// 処理概要　 : フレンドリクエストを承認する
// --------------------------------
Future<void> apploveFriendRequest(
    String sendUid, // 送信元ID
    String distUid, // 宛先ID
    ) async {
  try {
    DateTime now = DateTime.now();

    // 送信元に登録するデータを生成
    Map<String, dynamic> sendMap = {
      Strings.UID: distUid,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
      Strings.DELETE: now,
    };

    // 宛先に登録するデータを生成
    Map<String, dynamic> distMap = {
      Strings.UID: sendUid,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.UPDATE: now,
      Strings.DELETE: now,
    };

    await FirebaseFirestore.instance // 送信元を登録
        .collection(Strings.USERS)
        .doc(sendUid)
        .collection(Strings.FRIENDS)
        .doc(distUid)
        .set(sendMap);

    await FirebaseFirestore.instance // 宛先にデータを登録
        .collection(Strings.USERS)
        .doc(distUid)
        .collection(Strings.FRIENDS)
        .doc(sendUid)
        .set(distMap);

    await FirebaseFirestore.instance // 送信元を削除
        .collection(Strings.USERS)
        .doc(sendUid)
        .collection(Strings.RECEPTION_APPLICATIONS)
        .doc(distUid)
        .delete();

    await FirebaseFirestore.instance // 宛先を削除
        .collection(Strings.USERS)
        .doc(distUid)
        .collection(Strings.SEND_APPLICATIONS)
        .doc(sendUid)
        .delete();
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// --------------------------------
// メソッド名 : rejectFriendRequest
// 処理概要　 : フレンドリクエストを拒否する
// --------------------------------
Future<void> rejectFriendRequest(
    String sendUid, // 送信元ID
    String distUid, // 宛先ID
    ) async {
  try {

    await FirebaseFirestore.instance // 送信元を削除
        .collection(Strings.USERS)
        .doc(sendUid)
        .collection(Strings.SEND_APPLICATIONS)
        .doc(distUid)
        .delete();

    await FirebaseFirestore.instance // 宛先を削除
        .collection(Strings.USERS)
        .doc(distUid)
        .collection(Strings.RECEPTION_APPLICATIONS)
        .doc(sendUid)
        .delete();
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// --------------------------------
// メソッド名 : rejectFriend
// 処理概要　 : フレンド解除する
// --------------------------------
Future<void> rejectFriend(
    String sendUid, // 送信元ID
    String distUid, // 宛先ID
    ) async {
  try {

    await FirebaseFirestore.instance // 送信元を削除
        .collection(Strings.USERS)
        .doc(sendUid)
        .collection(Strings.FRIENDS)
        .doc(distUid)
        .delete();

    await FirebaseFirestore.instance // 送信元を削除
        .collection(Strings.USERS)
        .doc(distUid)
        .collection(Strings.FRIENDS)
        .doc(sendUid)
        .delete();
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}
