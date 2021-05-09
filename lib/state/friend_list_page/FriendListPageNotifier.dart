import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Strings.dart';
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

    // ----------------------------------
    // フレンドを取得する
    // ----------------------------------
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FRIENDS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> friendMapList = [];

    for (DocumentSnapshot friendDoc in friendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Strings.USERS)
          .doc(friendDoc.data()[Strings.UID])
          .get();

      Map<String, dynamic> map = {
        Strings.ID: friendDoc.id,
        Strings.FRIEND: friendDoc,
        Strings.USER: userDoc,
      };

      friendMapList.add(map);
    }

    state = FriendListPageState(
      friendMapList: friendMapList,
    );
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // ----------------------------------
    // フレンドを取得する
    // ----------------------------------
    List<DocumentSnapshot> friendDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FRIENDS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> friendMapList = [];

    for (DocumentSnapshot friendDoc in friendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Strings.USERS)
          .doc(friendDoc.data()[Strings.UID])
          .get();

      Map<String, dynamic> map = {
        Strings.ID: friendDoc.id,
        Strings.FRIEND: friendDoc,
        Strings.USER: userDoc,
      };

      friendMapList.add(map);
    }

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
