// ------------------------------
// メソッド名　: registerComment
// 処理概要　　: 投稿にコメントする
// 対象テーブル: comment, user, post
// 引数　　　　: reply   ... 投稿
// 　　　　　　: detail  ... 内容
// ------------------------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../strings.dart';
import 'auth_module.dart';

// ------------------------------
// commentを登録する
// ------------------------------
Future<DocumentReference> registerComment(String shoutId, String detail) async {
  try {
    // 現在の時間を取得
    DateTime now = DateTime.now();

    // commentに登録するデータを生成
    Map<String, dynamic> commentMap = {
      Strings.UID: user.uid, // ユーザーID
      Strings.SHOUT_ID: shoutId, // 投稿
      Strings.DETAIL: detail, // 文章
      Strings.CREATE: now, // 作成日
      Strings.READ: now, // 読込日
      Strings.UPDATE: now, // 更新日
      Strings.DELETE: now, // 削除日
    };

    DocumentReference comment = await FirebaseFirestore.instance // 登録
        .collection(Strings.COMMENTS)
        .add(commentMap);

    // usersに登録するデータを生成
    Map<String, dynamic> userCommentMap = {
      Strings.SHOUT_ID: shoutId,
      Strings.ID: comment.id,
      Strings.CREATE: now, // 作成日
      Strings.READ: now, // 読込日
      Strings.UPDATE: now, // 更新日
      Strings.DELETE: now, // 削除日
    };

    await FirebaseFirestore.instance // 登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.COMMENTS)
        .doc(comment.id)
        .set(userCommentMap);

    // shoutに登録するデータを生成
    Map<String, dynamic> shoutCommentMap = {
      Strings.UID: user.uid,
      Strings.ID: comment.id,
      Strings.CREATE: now, // 作成日
      Strings.READ: now, // 読込日
      Strings.UPDATE: now, // 更新日
      Strings.DELETE: now, // 削除日
    };

    await FirebaseFirestore.instance // 登録
        .collection(Strings.SHOUTS)
        .doc(shoutId)
        .collection(Strings.COMMENTS).doc(comment.id)
        .set(shoutCommentMap);

    // リターン
    return comment;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// commentを変更する
// ------------------------------
Future<String> updateComment(String id, Map<String, dynamic> map) async {
  try {
    await FirebaseFirestore.instance // コメント内容を更新
        .collection(Strings.COMMENTS)
        .doc(id)
        .update(map);

    // リターン
    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// commentを削除する
// ------------------------------
Future<void> deleteComment(String postId, String commentId) async {
  try {
    await FirebaseFirestore.instance // commentからデータを削除
        .collection(Strings.COMMENTS)
        .doc(commentId)
        .delete();

    await FirebaseFirestore.instance // usersからデータを削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.COMMENTS)
        .doc(commentId)
        .delete();

    await FirebaseFirestore.instance // postからデータを削除
        .collection(Strings.SHOUTS)
        .doc(postId)
        .collection(Strings.COMMENTS)
        .doc(commentId)
        .delete();

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

  }
}
