import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';
import 'FriendListPageState.dart';

// ------------------------------------
// クラス名　: FriendListPageNotifier
// クラス概要: Friend一覧タブNotifier
// ------------------------------------
class FriendListPageNotifier extends StateNotifier<FriendListPageState> with LocatorMixin {
  FriendListPageNotifier() : super(FriendListPageState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // フレンド一覧を取得する
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.FRIENDS)
        .get())
        .docs;

    // 取得したデータを格納するマップの生成
    List<Map<String, dynamic>> friendMapList = [];

    // マップに格納
    for (DocumentSnapshot friendDoc in friendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(friendDoc.data()[Const.UID])
          .get();

      Map<String, dynamic> map = {
        Const.ID: friendDoc.id,
        Const.FRIEND: friendDoc,
        Const.USER: userDoc,
      };

      friendMapList.add(map);
    }

    // stateを更新する
    state = FriendListPageState(
      friendMapList: friendMapList,
    );
  }

  // --------------------------------
  // メソッド名 : reload
  // 処理概要　 : 際読み込みを行う
  // --------------------------------
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // フレンド一覧を取得する
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.FRIENDS)
        .get())
        .docs;

    // 取得したデータを格納するマップの生成
    List<Map<String, dynamic>> friendMapList = [];

    // マップに格納
    for (DocumentSnapshot friendDoc in friendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(friendDoc.data()[Const.UID])
          .get();

      Map<String, dynamic> map = {
        Const.ID: friendDoc.id,
        Const.FRIEND: friendDoc,
        Const.USER: userDoc,
      };

      friendMapList.add(map);
    }

    // stateを更新する
    if (currentState is FriendListPageStateData) {
      // stateを更新
      state = currentState.copyWith(
        friendMapList: friendMapList,
      );
    } else {
      state = FriendListPageState(
        friendMapList: friendMapList,
      );
    }
  }
}
