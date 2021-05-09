import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';
import 'UserListTabState.dart';

// ------------------------------------
// クラス名　: UserListTabNotifier
// クラス概要: ユーザー一覧ページNotifier
// ------------------------------------
class UserListTabNotifier extends StateNotifier<UserListTabState> with LocatorMixin {
  UserListTabNotifier() : super(UserListTabState.loading());

  // 初期化
  void initState() async {
    super.initState();

    // ユーザー一覧を取得
    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .orderBy(Const.UPDATE, descending: true)
        .get()
    ).docs;

    // ユーザーデータを格納するマップの生成
    List<Map<String, dynamic>> userMapList = [];

    // ユーザーデータを格納する
    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Const.ID: doc.id,
        Const.USER: doc,
      };

      userMapList.add(map);
    }

    // stateを更新する
    state = UserListTabState(
        userMapList: userMapList
    );
  }

  // --------------------------------
  // メソッド名 : reload
  // 処理概要　 : 再読み込みを行う
  // --------------------------------
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    // ユーザー一覧を取得
    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance
        .collection(Const.USERS)
        .orderBy(Const.CREATE, descending: true)
        .get()
    ).docs;

    // ユーザー情報を格納するマップを生成
    List<Map<String, dynamic>> userMapList = [];

    // マップに格納
    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Const.ID: doc.id,
        Const.USER: doc,
      };

      userMapList.add(map);
    }

    // stateを更新
    if (currentState is UserListTabStateData) {
      // stateを更新
      state = currentState.copyWith(
          userMapList: userMapList
      );
    } else {
      state = UserListTabState(
          userMapList: userMapList
      );
    }
  }
}
