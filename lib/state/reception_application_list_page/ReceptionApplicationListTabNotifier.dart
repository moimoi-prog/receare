import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Strings.dart';
import 'ReceptionApplicationListTabState.dart';

// ------------------------------------
// クラス名　: ReceptionApplicationListTabNotifier
// クラス概要: Friend一覧タブNotifier
// ------------------------------------
class ReceptionApplicationListTabNotifier extends StateNotifier<ReceptionApplicationListTabState> with LocatorMixin {
  ReceptionApplicationListTabNotifier() : super(ReceptionApplicationListTabState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // ----------------------------------
    // 受信申請を取得する
    // ----------------------------------
    List<DocumentSnapshot> receptionDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.RECEPTION_APPLICATIONS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> receptionMapList = [];

    for (DocumentSnapshot friendDoc in receptionDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Strings.USERS)
          .doc(friendDoc.data()[Strings.UID])
          .get();

      Map<String, dynamic> map = {
        Strings.ID: friendDoc.id,
        Strings.RECEPTION_APPLICATION: friendDoc,
        Strings.USER: userDoc,
      };

      receptionMapList.add(map);
    }

    state = ReceptionApplicationListTabState(
      receptionMapList: receptionMapList,
    );
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // ----------------------------------
    // 受信申請を取得する
    // ----------------------------------
    List<DocumentSnapshot> receptionDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.RECEPTION_APPLICATIONS)
        .get())
        .docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> receptionMapList = [];

    for (DocumentSnapshot friendDoc in receptionDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Strings.USERS)
          .doc(friendDoc.data()[Strings.UID])
          .get();

      Map<String, dynamic> map = {
        Strings.ID: friendDoc.id,
        Strings.RECEPTION_APPLICATION: friendDoc,
        Strings.USER: userDoc,
      };

      receptionMapList.add(map);
    }

    if (currentState is ReceptionApplicationListTabStateData) {
      // stateを更新
      state = currentState.copyWith(
        receptionMapList: receptionMapList,
      );
    } else {
      state = ReceptionApplicationListTabState(
        receptionMapList: receptionMapList,
      );
    }
  }
}