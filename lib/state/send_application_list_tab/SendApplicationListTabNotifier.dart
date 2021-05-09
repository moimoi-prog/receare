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

    // ----------------------------------
    // 受信申請を取得する
    // ----------------------------------
    List<DocumentSnapshot> sendDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.SEND_APPLICATIONS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> sendMapList = [];

    for (DocumentSnapshot sendDoc in sendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
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

    state = SendApplicationListTabState(
      sendMapList: sendMapList,
    );
  }

  // documentを読み込む
  Future reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // ----------------------------------
    // 受信申請を取得する
    // ----------------------------------
    List<DocumentSnapshot> sendDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.SEND_APPLICATIONS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> sendMapList = [];

    for (DocumentSnapshot sendDoc in sendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
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
