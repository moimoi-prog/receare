import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/state/shout_list_page/ShoutListPageState.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Strings.dart';

// ------------------------------------
// クラス名　: ShoutListPageNotifier
// クラス概要: Shout一覧タブNotifier
// ------------------------------------
class ShoutListPageNotifier extends StateNotifier<ShoutListPageState> with LocatorMixin {
  ShoutListPageNotifier() : super(ShoutListPageState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // フレンド一覧を取得
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance // シャウト一覧を取得
            .collection(Strings.USERS)
            .doc(user.uid)
            .collection(Strings.FRIENDS)
            .get())
        .docs;

    List<String> friends = [];

    for (DocumentSnapshot friendDoc in friendDocs) {
      friends.add(friendDoc.id);
    }

    friends.add(user.uid);

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // シャウト一覧を取得
            .collection(Strings.SHOUTS)
            .where(Strings.UID, whereIn: friends)
            .orderBy(Strings.UPDATE, descending: true)
            .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> shoutMapList = [];

    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Strings.ID: doc.id,
        Strings.SHOUT: doc,
        Strings.UID: doc.data()[Strings.UID],
        Strings.DETAIL: doc.data()[Strings.DETAIL],
        Strings.IMAGE_PATH: doc.data()[Strings.IMAGE_PATH],
        Strings.COMMENTS: null,
        Strings.CREATE: doc.data()[Strings.CREATE],
        Strings.READ: doc.data()[Strings.READ],
        Strings.UPDATE: doc.data()[Strings.UPDATE],
        Strings.DELETE: doc.data()[Strings.DELETE],
      };

      shoutMapList.add(map);
    }

    state = ShoutListPageState(shoutMapList: shoutMapList);
  }

  // documentを読み込む
  void reloadComments(String shoutId) async {
    // 現在のステータスを取得
    final currentState = state;

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance
        .collection(Strings.SHOUTS)
        .doc(shoutId)
        .collection(Strings.COMMENTS)
        .get()
    ).docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> shoutMapList = [];

    if (currentState is ShoutListPageStateData) {
      for (Map<String, dynamic> shoutMap in currentState.shoutMapList) {
        if (shoutId == shoutMap[Strings.ID]) {
          Map<String, dynamic> map = {
            Strings.ID: shoutId,
            Strings.SHOUT: shoutMap[Strings.SHOUT],
            Strings.UID: shoutMap[Strings.UID],
            Strings.DETAIL: shoutMap[Strings.DETAIL],
            Strings.IMAGE_PATH: shoutMap[Strings.IMAGE_PATH],
            Strings.COMMENTS: docs,
            Strings.CREATE: shoutMap[Strings.CREATE],
            Strings.READ: shoutMap[Strings.READ],
            Strings.UPDATE: shoutMap[Strings.UPDATE],
            Strings.DELETE: shoutMap[Strings.DELETE],
          };
          shoutMapList.add(map);
        } else {
          shoutMapList.add(shoutMap);
        }
      }
      // stateを更新
      state = currentState.copyWith(shoutMapList: shoutMapList);
    } else {
      state = ShoutListPageState(shoutMapList: shoutMapList);
    }
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // フレンド一覧を取得
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance // シャウト一覧を取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FRIENDS)
        .get())
        .docs;

    List<String> friends = [];

    for (DocumentSnapshot friendDoc in friendDocs) {
      friends.add(friendDoc.id);
    }

    friends.add(user.uid);

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // シャウト一覧を取得
        .collection(Strings.SHOUTS)
        .where(Strings.UID, whereIn: friends)
        .orderBy(Strings.UPDATE, descending: true)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> shoutMapList = [];

    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Strings.ID: doc.id,
        Strings.SHOUT: doc,
        Strings.UID: doc.data()[Strings.UID],
        Strings.DETAIL: doc.data()[Strings.DETAIL],
        Strings.IMAGE_PATH: doc.data()[Strings.IMAGE_PATH],
        Strings.COMMENTS: null,
        Strings.CREATE: doc.data()[Strings.CREATE],
        Strings.READ: doc.data()[Strings.READ],
        Strings.UPDATE: doc.data()[Strings.UPDATE],
        Strings.DELETE: doc.data()[Strings.DELETE],
      };

      shoutMapList.add(map);
    }

    if (currentState is ShoutListPageStateData) {
      // stateを更新
      state = currentState.copyWith(shoutMapList: shoutMapList);
    } else {
      state = ShoutListPageState(shoutMapList: shoutMapList);
    }
  }
}
