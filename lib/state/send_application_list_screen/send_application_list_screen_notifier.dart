import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/firebase/auth_module.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../strings.dart';
import 'send_application_list_screen_state.dart';

// ------------------------------------
// クラス名　: SendApplicationListScreenNotifier
// クラス概要: Friend一覧タブNotifier
// ------------------------------------
class SendApplicationListScreenNotifier extends StateNotifier<SendApplicationListScreenState> with LocatorMixin {
  SendApplicationListScreenNotifier() : super(SendApplicationListScreenState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // ----------------------------------
    // 受信申請を取得する
    // ----------------------------------
    List<DocumentSnapshot> sendDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.SEND_APPLICATIONS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> sendMapList = [];

    for (DocumentSnapshot sendDoc in sendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Strings.USERS)
          .doc(sendDoc.data()[Strings.UID])
          .get();

      Map<String, dynamic> map = {
        Strings.ID: sendDoc.id,
        Strings.SEND_APPLICATION: sendDoc,
        Strings.USER: userDoc,
      };

      sendMapList.add(map);
    }

    state = SendApplicationListScreenState(
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
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.SEND_APPLICATIONS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> sendMapList = [];

    for (DocumentSnapshot sendDoc in sendDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Strings.USERS)
          .doc(sendDoc.data()[Strings.UID])
          .get();

      Map<String, dynamic> map = {
        Strings.ID: sendDoc.id,
        Strings.SEND_APPLICATION: sendDoc,
        Strings.USER: userDoc,
      };

      sendMapList.add(map);
    }

    if (currentState is SendApplicationListScreenStateData) {
      // stateを更新
      state = currentState.copyWith(
        sendMapList: sendMapList,
      );
    } else {
      state = SendApplicationListScreenState(
        sendMapList: sendMapList,
      );
    }
  }
}
