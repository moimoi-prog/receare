import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';
import 'SendApplicationListTabState.dart';

// ------------------------------------
// クラス名　: SendApplicationListTabNotifier
// クラス概要: Friend一覧タブNotifier
// ------------------------------------
class SendApplicationListTabNotifier extends StateNotifier<SendApplicationListTabState> with LocatorMixin {
  SendApplicationListTabNotifier() : super(SendApplicationListTabState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // 送信リクエスト一覧を取得する
    List<DocumentSnapshot> sendDocs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.SEND_APPLICATIONS)
        .get())
        .docs;

    // リクエストを格納するマップを生成
    List<Map<String, dynamic>> sendMapList = [];

    // マップに格納
    for (DocumentSnapshot sendDoc in sendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(sendDoc.data()[Const.UID])
          .get();

      Map<String, dynamic> map = {
        Const.ID: sendDoc.id,
        Const.SEND_APPLICATION: sendDoc,
        Const.USER: userDoc,
      };

      sendMapList.add(map);
    }

    // stateを更新
    state = SendApplicationListTabState(
      sendMapList: sendMapList,
    );
  }

  // --------------------------------
  // メソッド名 : reload
  // 処理概要　 : 際読み込みを行う
  // --------------------------------
  Future reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // 送信リクエスト一覧を取得する
    List<DocumentSnapshot> sendDocs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.SEND_APPLICATIONS)
        .get())
        .docs;

    // リクエストを格納するマップを生成
    List<Map<String, dynamic>> sendMapList = [];

    // マップに格納
    for (DocumentSnapshot sendDoc in sendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(sendDoc.data()[Const.UID])
          .get();

      Map<String, dynamic> map = {
        Const.ID: sendDoc.id,
        Const.SEND_APPLICATION: sendDoc,
        Const.USER: userDoc,
      };

      sendMapList.add(map);
    }

    // stateを更新
    if (currentState is SendApplicationListTabStateData) {
      // stateを更新
      state = currentState.copyWith(
        sendMapList: sendMapList,
      );
    } else {
      state = SendApplicationListTabState(
        sendMapList: sendMapList,
      );
    }
  }
}
