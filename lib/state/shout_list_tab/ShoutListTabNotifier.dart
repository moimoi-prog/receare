import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receare/data/ShoutData.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/state/shout_list_tab/ShoutListTabState.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';

// ------------------------------------
// クラス名　: ShoutListTabNotifier
// クラス概要: Shout一覧ページNotifier
// ------------------------------------
class ShoutListTabNotifier extends StateNotifier<ShoutListTabState> with LocatorMixin {
  ShoutListTabNotifier() : super(ShoutListTabState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // フレンド一覧を取得
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.FRIENDS)
        .get())
        .docs;

    // uidリストにフレンドのUIDを格納
    List<String> uids = [];

    for (DocumentSnapshot friendDoc in friendDocs) {
      uids.add(friendDoc.id);
    }

    // uidリストに自分のUIDを格納
    uids.add(user.uid);

    // シャウト一覧を取得する
    List<DocumentSnapshot> shoutDocs = (await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .where(Const.UID, whereIn: uids)
        .orderBy(Const.UPDATE, descending: true)
        .get())
        .docs;

    // シャウトごとのユーザー情報とコメントと画像を取得し、シャウトデータリストを生成
    List<ShoutData> shoutDataList = [];

    for (DocumentSnapshot shoutDoc in shoutDocs) {
      DocumentSnapshot userDoc = (await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(shoutDoc.data()[Const.UID])
          .get());

      // コメントを取得
      QuerySnapshot commentQuery = (await FirebaseFirestore.instance
          .collection(Const.SHOUTS)
          .doc(shoutDoc.id)
          .collection(Const.COMMENTS)
          .orderBy(Const.CREATE, descending: true)
          .get());

      // 画像パスを取得
      QuerySnapshot imagePathQuery = (await FirebaseFirestore.instance
          .collection(Const.SHOUTS)
          .doc(shoutDoc.id)
          .collection(Const.IMAGE_PATH)
          .orderBy(Const.INDEX)
          .get());

      // シャウトデータを生成
      ShoutData sd = ShoutData(
        id: shoutDoc.id,
        uid: userDoc.id,
        userDoc: userDoc,
        detail: shoutDoc,
        commentQuery: commentQuery,
        imagePathQuery: imagePathQuery,
      );

      // rシャウトデータをリストに格納
      shoutDataList.add(sd);
    }

    // stateを初期化する
    state = ShoutListTabState(shoutDataList: shoutDataList);
  }

  // --------------------------------
  // メソッド名 : reload
  // 処理概要　 : 再読み込みを行う
  // --------------------------------
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // フレンド一覧を取得
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.FRIENDS)
        .get())
        .docs;

    // uidリストにフレンドのUIDを格納
    List<String> uids = [];

    for (DocumentSnapshot friendDoc in friendDocs) {
      uids.add(friendDoc.id);
    }

    // uidリストに自分のUIDを格納
    uids.add(user.uid);

    // シャウト一覧を取得する
    List<DocumentSnapshot> shoutDocs = (await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .where(Const.UID, whereIn: uids)
        .orderBy(Const.UPDATE, descending: true)
        .get())
        .docs;

    // シャウトごとのユーザー情報とコメントと画像を取得し、シャウトデータリストを生成
    List<ShoutData> shoutDataList = [];

    for (DocumentSnapshot shoutDoc in shoutDocs) {
      DocumentSnapshot userDoc = (await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(shoutDoc.data()[Const.UID])
          .get());

      // コメントを取得
      QuerySnapshot commentQuery = (await FirebaseFirestore.instance
          .collection(Const.SHOUTS)
          .doc(shoutDoc.id)
          .collection(Const.COMMENTS)
          .orderBy(Const.CREATE, descending: true)
          .get());

      // 画像パスを取得
      QuerySnapshot imagePathQuery = (await FirebaseFirestore.instance
          .collection(Const.SHOUTS)
          .doc(shoutDoc.id)
          .collection(Const.IMAGE_PATH)
          .orderBy(Const.INDEX)
          .get());

      // シャウトデータを生成
      ShoutData sd = ShoutData(
        id: shoutDoc.id,
        uid: userDoc.id,
        userDoc: userDoc,
        detail: shoutDoc,
        commentQuery: commentQuery,
        imagePathQuery: imagePathQuery,
      );

      // シャウトデータをリストに格納
      shoutDataList.add(sd);
    }

    // stateを更新
    if (currentState is ShoutListTabStateData) {
      state = currentState.copyWith(shoutDataList: shoutDataList);
    } else {
      state = ShoutListTabState(shoutDataList: shoutDataList);
    }
  }

  // --------------------------------
  // メソッド名 : reloadComments
  // 処理概要　 : コメントの際読み込みを行う
  // --------------------------------
  void reloadComments(String shoutId) async {
    // 現在のステータスを取得
    final currentState = state;

    // コメントデータを取得
    QuerySnapshot commentQuery = (await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .doc(shoutId)
        .collection(Const.COMMENTS)
        .orderBy(Const.CREATE, descending: true)
        .get());

    // コメントデータを格納するマップを生成
    List<ShoutData> shoutDataList = [];

    // stateを更新
    if (currentState is ShoutListTabStateData) {
      for (ShoutData sd in currentState.shoutDataList) {
        if (shoutId == sd.id) {
          sd.commentQuery = commentQuery;
        }

        shoutDataList.add(sd);
      }

      // stateを更新
      state = currentState.copyWith(shoutDataList: shoutDataList);
    } else {
      state = ShoutListTabState(shoutDataList: shoutDataList);
    }
  }
}
