import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Const.dart';
import 'AuthModule.dart';

// --------------------------------
// メソッド名 : registerComment
// 処理概要　 : commentを登録する
// --------------------------------
Future<DocumentReference> registerComment(String shoutId, String detail) async {
  try {
    // 現在の時間を取得
    DateTime now = DateTime.now();

    // コメントに登録するデータを生成
    Map<String, dynamic> commentMap = {
      Const.UID: user.uid, // ユーザーID
      Const.SHOUT_ID: shoutId, // 投稿
      Const.DETAIL: detail, // 文章
      Const.CREATE: now, // 作成日
      Const.READ: null, // 読込日
      Const.UPDATE: now, // 更新日
      Const.DELETE: null, // 削除日
    };

    // コメントを登録
    DocumentReference comment = await FirebaseFirestore.instance
        .collection(Const.COMMENTS)
        .add(commentMap);

    // ユーザーとコメントを紐づけるデータを生成
    Map<String, dynamic> userCommentMap = {
      Const.SHOUT_ID: shoutId,
      Const.ID: comment.id,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // ユーザーとコメントの紐付けデータを登録
    await FirebaseFirestore.instance // 登録
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.COMMENTS)
        .doc(comment.id)
        .set(userCommentMap);

    // シャウトとコメントを紐づけるデータを生成
    Map<String, dynamic> shoutCommentMap = {
      Const.UID: user.uid,
      Const.ID: comment.id,
      Const.CREATE: now,
      Const.READ: null,
      Const.UPDATE: now,
      Const.DELETE: null,
    };

    // シャウトとコメントの紐付け情報を登録
    await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .doc(shoutId)
        .collection(Const.COMMENTS).doc(comment.id)
        .set(shoutCommentMap);

    // コメントデータへの参照を返す
    return comment;

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// --------------------------------
// メソッド名 : updateComment
// 処理概要　 : commentを変更する
// --------------------------------
Future<String> updateComment(String id, Map<String, dynamic> map) async {
  try {
    // コメントを更新
    await FirebaseFirestore.instance
        .collection(Const.COMMENTS)
        .doc(id)
        .update(map);

    // コメントIDを返す
    return id;

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// --------------------------------
// メソッド名 : deleteComment
// 処理概要　 : commentを削除する
// --------------------------------
Future<void> deleteComment(String postId, String commentId) async {
  try {
    // シャウトとコメントの紐付けを削除
    await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .doc(postId)
        .collection(Const.COMMENTS)
        .doc(commentId)
        .delete();

    // ユーザーとコメントの紐付けを削除
    await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.COMMENTS)
        .doc(commentId)
        .delete();

    // コメントデータを削除
    await FirebaseFirestore.instance
        .collection(Const.COMMENTS)
        .doc(commentId)
        .delete();

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

  }
}
