import 'package:cloud_firestore/cloud_firestore.dart';

// --------------------------------
// クラス名 　: ShoutData
// クラス概要 : シャウトデータオブジェクト
// --------------------------------
class ShoutData {
  String id;
  String uid;
  DocumentSnapshot detail;
  DocumentSnapshot userDoc;
  QuerySnapshot commentQuery;
  QuerySnapshot imagePathQuery;

  // --------------------------------
  // メソッド名 : ShoutData
  // 処理概要　 : コンストラクタ
  // --------------------------------
  ShoutData({
    this.id,
    this.uid,
    this.detail,
    this.userDoc,
    this.commentQuery,
    this.imagePathQuery,
  });
}
