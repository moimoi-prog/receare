import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receare/data/ShoutData.dart';
import 'package:receare/state/user_detail_page/UserDetailPageState.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';

// ------------------------------------
// クラス名　: UserDetailPageNotifier
// クラス概要: ユーザー詳細ページNotifier
// ------------------------------------
class UserDetailPageNotifier extends StateNotifier<UserDetailPageState> with LocatorMixin {
  UserDetailPageNotifier() : super(UserDetailPageState.loading());

  void initState() async {
    super.initState();
  }

  // --------------------------------
  // メソッド名 : load
  // 処理概要　 : ユーザー情報を全て読み込み
  // --------------------------------
  Future<void> load(String uid) async {
    final currentState = state;

    // user情報を取得
    DocumentSnapshot userDoc = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(uid)
        .get());

    // shout情報を取得
    List<DocumentSnapshot> shoutDocs = (await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .where(Const.UID, isEqualTo: uid)
        .orderBy(Const.UPDATE, descending: true)
        .get()).docs;

    // シャウトごとのコメントと画像を取得し、シャウトデータリストを生成
    List<ShoutData> shoutDataList = [];

    for (DocumentSnapshot shoutDoc in shoutDocs) {
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

    if (currentState is UserDetailPageStateData) {
      // stateを更新
      state = currentState.copyWith(
        userDoc: userDoc,
        shoutDataList: shoutDataList,
      );
    } else {
      state = UserDetailPageState(
        userDoc: userDoc,
        shoutDataList: shoutDataList,
      );
    }
  }

  // --------------------------------
  // メソッド名 : loadUser
  // 処理概要　 : ユーザーの詳細情報のみを読み込み
  // --------------------------------
  Future<void> loadUser(String uid) async {
    final currentState = state;

    if (currentState is UserDetailPageStateData) {

      // user情報を取得
      DocumentSnapshot userDoc = (await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(uid)
          .get());

      // stateを更新
      state = currentState.copyWith(
        userDoc: userDoc,
        shoutDataList: currentState.shoutDataList,
      );
    }
  }

  // --------------------------------
  // メソッド名 : loadShout
  // 処理概要　 : ユーザーのシャウト情報のみを読み込み
  // --------------------------------
  Future<void> loadShout(String uid) async {
    final currentState = state;

    // シャウト一覧を取得する
    List<DocumentSnapshot> shoutDocs = (await FirebaseFirestore.instance
        .collection(Const.SHOUTS)
        .where(Const.UID, isEqualTo: uid)
        .orderBy(Const.UPDATE, descending: true)
        .get())
        .docs;

    if (currentState is UserDetailPageStateData) {
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

      // stateを更新
      state = currentState.copyWith(
        userDoc: currentState.userDoc,
        shoutDataList: shoutDataList,
      );
    }
  }

// --------------------------------
// メソッド名 : reloadShout
// 処理概要　 : ユーザーのシャウト情報のみを再読み込み
// --------------------------------
  Future<void> reloadShout() async {
    final currentState = state;

    if (currentState is UserDetailPageStateData) {
      // シャウト一覧を取得する
      List<DocumentSnapshot> shoutDocs = (await FirebaseFirestore.instance
          .collection(Const.SHOUTS)
          .where(Const.UID, isEqualTo: currentState.userDoc.id)
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

      // stateを更新
      state = currentState.copyWith(
        userDoc: currentState.userDoc,
        shoutDataList: shoutDataList,
      );
    }
  }

// --------------------------------
// メソッド名 :
// 処理概要　 :
// --------------------------------
  void reset() {
    if (state is UserDetailPageStateData) {
      state = UserDetailPageState.loading();
    }
  }
}
