import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:receare/firebase/StorageModule.dart';

import '../Const.dart';

// --------------------------------
// メソッド名 : registerUser
// 処理概要　 : ユーザーを登録する
// --------------------------------
Future<void> registerUser(String name, String uid, String email) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    // ユーザーに登録するデータを生成
    Map<String, dynamic> map = {
      Const.UID: uid,
      Const.NAME: name,
      Const.MAIL: email,
      Const.MESSAGE: "",
      Const.ICON_IMAGE_PATH: "",
      Const.HEADER_IMAGE_PATH: "",
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // ユーザーデータを登録
    await FirebaseFirestore.instance
        .collection(Const.USERS)
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
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    // 登録データを生成
    Map<String, dynamic> map = {};

    // 更新日をマップに格納
    map.addAll({Const.UPDATE: now});

    // 変更するデータをマップに格納
    if (name != null) {
      map.addAll({Const.NAME: name});
    }

    if (uid != null) {
      map.addAll({Const.UID: uid});
    }

    if (email != null) {
      map.addAll({Const.MAIL: email});
    }

    if (message != null) {
      map.addAll({Const.MESSAGE: message});
    }

    if (iconImage != null) {
      // 画像アップロードする
      String iconImagePath = await uploadImage(iconImage);

      map.addAll({Const.ICON_IMAGE_PATH: iconImagePath});
    }

    if (headerImage != null) {
      // 画像をアップロードする
      String headerImagePath = await uploadImage(headerImage);

      map.addAll({Const.HEADER_IMAGE_PATH: headerImagePath});
    }

    // ユーザーデータを更新する
    await FirebaseFirestore.instance
        .collection(Const.USERS)
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
    String sendUid,
    String distUid,
    ) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    // 送信元に登録するデータを生成
    Map<String, dynamic> sendMap = {
      Const.UID: distUid,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // 宛先に登録するデータを生成
    Map<String, dynamic> distMap = {
      Const.UID: sendUid,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // 送信元にデータを登録
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(sendUid)
        .collection(Const.SEND_APPLICATIONS)
        .doc(distUid)
        .set(sendMap);

    // 宛先にデータを登録
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(distUid)
        .collection(Const.RECEPTION_APPLICATIONS)
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
    String sendUid,
    String distUid,
    ) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    // 送信元に登録するデータを生成
    Map<String, dynamic> sendMap = {
      Const.UID: distUid,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // 宛先に登録するデータを生成
    Map<String, dynamic> distMap = {
      Const.UID: sendUid,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // 送信元にデータを登録
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(sendUid)
        .collection(Const.FRIENDS)
        .doc(distUid)
        .set(sendMap);

    // 宛先にデータを登録
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(distUid)
        .collection(Const.FRIENDS)
        .doc(sendUid)
        .set(distMap);

    // 送信元のリクエスト情報を削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(sendUid)
        .collection(Const.RECEPTION_APPLICATIONS)
        .doc(distUid)
        .delete();

    // 宛先のリクエスト情報を削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(distUid)
        .collection(Const.SEND_APPLICATIONS)
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
    String sendUid,
    String distUid,
    ) async {
  try {
    // 送信元のリクエスト情報を削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(sendUid)
        .collection(Const.SEND_APPLICATIONS)
        .doc(distUid)
        .delete();

    // 宛先のリクエスト情報を削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(distUid)
        .collection(Const.RECEPTION_APPLICATIONS)
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
    String sendUid,
    String distUid,
    ) async {
  try {
    // 送信元のフレンド情報を削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(sendUid)
        .collection(Const.FRIENDS)
        .doc(distUid)
        .delete();

    // 宛先のリクエスト情報を削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(distUid)
        .collection(Const.FRIENDS)
        .doc(sendUid)
        .delete();

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}
