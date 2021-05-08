import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/state/user_list_screen/UserListPageState.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../strings.dart';

// ------------------------------------
// クラス名　: UserListPageNotifier
// クラス概要: Shout一覧タブNotifier
// ------------------------------------
class UserListPageNotifier extends StateNotifier<UserListPageState> with LocatorMixin {
  UserListPageNotifier() : super(UserListPageState.loading());

  // 初期化
  void initState() async {
    super.initState();

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // ユーザー一覧を取得
        .collection(Strings.USERS)
        .orderBy(Strings.UPDATE, descending: true)
        .get()
    ).docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> userMapList = [];

    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Strings.ID: doc.id,
        Strings.USER: doc,
      };

      userMapList.add(map);
    }

    state = UserListPageState(
        userMapList: userMapList
    );
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // ユーザー一覧を取得
        .collection(Strings.USERS)
        .orderBy(Strings.CREATE, descending: true)
        .get()
    ).docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> userMapList = [];

    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Strings.ID: doc.id,
        Strings.USER: doc,
      };

      userMapList.add(map);
    }

    if (currentState is UserListPageStateData) {
      // stateを更新
      state = currentState.copyWith(
          userMapList: userMapList
      );
    } else {
      state = UserListPageState(
          userMapList: userMapList
      );
    }
  }
}
