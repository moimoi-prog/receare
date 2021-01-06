import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/state/shout_list_screen/shout_list_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../strings.dart';


// ------------------------------------
// クラス名　: ShoutListScreenNotifier
// クラス概要: Shout一覧タブNotifier
// ------------------------------------
class ShoutListScreenNotifier extends StateNotifier<ShoutListScreenState> with LocatorMixin {
  ShoutListScreenNotifier() : super(ShoutListScreenState.loading());

  // 初期化
  void initState() async {
    super.initState();

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // シャウト一覧を取得
        .collection(Strings.SHOUTS)
        .orderBy(Strings.CREATE, descending: true)
        .get()
    ).docs;

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

    state = ShoutListScreenState(
        shoutMapList: shoutMapList
    );
  }

  // documentを読み込む
  void reloadComments(String shoutId) async {
    // 現在のステータスを取得
    final currentState = state;

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance.collection(Strings.SHOUTS).doc(shoutId).collection(Strings.COMMENTS)
        .get()
    ).docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> shoutMapList = [];

    if (currentState is ShoutListScreenStateData) {
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
      state = currentState.copyWith(
          shoutMapList: shoutMapList
      );
    } else {
      state = ShoutListScreenState(
          shoutMapList: shoutMapList
      );
    }
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // シャウト一覧を取得する
        .collection(Strings.SHOUTS)
        .orderBy(Strings.CREATE, descending: true)
        .get()
    ).docs;

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

    if (currentState is ShoutListScreenStateData) {
      // stateを更新
      state = currentState.copyWith(
          shoutMapList: shoutMapList
      );
    } else {
      state = ShoutListScreenState(
          shoutMapList: shoutMapList
      );
    }
  }
}
