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

    /** シャウト一覧に表示するユーザーのIDをリストに格納する */
    /** 自分のIDとフレンドのID */
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

    /** シャウト一覧を取得する */
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

    /** stateを初期化する */
    state = ShoutListTabState(shoutDataList: shoutDataList);
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    /** シャウト一覧に表示するユーザーのIDをリストに格納する */
    /** 自分のIDとフレンドのID */
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

    /** シャウト一覧を取得する */
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

    if (currentState is ShoutListTabStateData) {
      // stateを更新
      state = currentState.copyWith(shoutDataList: shoutDataList);
    } else {
      state = ShoutListTabState(shoutDataList: shoutDataList);
    }
  }

  // documentを読み込む
  void reloadComments(String shoutId) async {
    // 現在のステータスを取得
    final currentState = state;

    QuerySnapshot commentQuery = (await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .doc(shoutId)
        .collection(Const.COMMENTS)
        .orderBy(Const.CREATE, descending: true)
        .get());

    // 登録するMapを生成
    List<ShoutData> shoutDataList = [];

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
