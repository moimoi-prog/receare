import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/state/user_list_screen/user_list_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../strings.dart';

// ------------------------------------
// クラス名　: UserListScreenNotifier
// クラス概要: Shout一覧タブNotifier
// ------------------------------------
class UserListScreenNotifier extends StateNotifier<UserListScreenState> with LocatorMixin {
  UserListScreenNotifier() : super(UserListScreenState.loading());

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

    state = UserListScreenState(
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

    if (currentState is UserListScreenStateData) {
      // stateを更新
      state = currentState.copyWith(
          userMapList: userMapList
      );
    } else {
      state = UserListScreenState(
          userMapList: userMapList
      );
    }
  }
}
