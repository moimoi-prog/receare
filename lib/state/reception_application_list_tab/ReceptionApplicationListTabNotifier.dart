import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';
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

    // 受信リクエスト一覧を取得する
    List<DocumentSnapshot> receptionDocs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.RECEPTION_APPLICATIONS)
        .get())
        .docs;

    // リクエストを格納するマップを生成
    List<Map<String, dynamic>> receptionMapList = [];

    // マップに格納
    for (DocumentSnapshot friendDoc in receptionDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(Const.USERS)
          .doc(friendDoc.data()[Const.UID])
          .get();

      Map<String, dynamic> map = {
        Const.ID: friendDoc.id,
        Const.RECEPTION_APPLICATION: friendDoc,
        Const.USER: userDoc,
      };

      receptionMapList.add(map);
    }

    // stateを更新する
    state = ReceptionApplicationListTabState(
      receptionMapList: receptionMapList,
    );
  }

  // --------------------------------
  // メソッド名 : reload
  // 処理概要　 : 際読み込みを行う
  // --------------------------------
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // 受信リクエスト一覧を取得する
    List<DocumentSnapshot> receptionDocs = (await FirebaseFirestore.instance // フレンド一覧を取得
        .collection(Const.USERS)
        .doc(user.uid)
        .collection(Const.RECEPTION_APPLICATIONS)
        .get())
        .docs;

    // リクエストを格納するマップを生成
    List<Map<String, dynamic>> receptionMapList = [];

    // マップに格納する
    for (DocumentSnapshot friendDoc in receptionDocs) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance // 申請者情報を取得
          .collection(Const.USERS)
          .doc(friendDoc.data()[Const.UID])
          .get();

      Map<String, dynamic> map = {
        Const.ID: friendDoc.id,
        Const.RECEPTION_APPLICATION: friendDoc,
        Const.USER: userDoc,
      };

      receptionMapList.add(map);
    }

    //stateを更新する
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
