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

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // ユーザー一覧を取得
        .collection(Const.USERS)
        .orderBy(Const.UPDATE, descending: true)
        .get()
    ).docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> userMapList = [];

    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Const.ID: doc.id,
        Const.USER: doc,
      };

      userMapList.add(map);
    }

    state = UserListTabState(
        userMapList: userMapList
    );
  }

  // documentを読み込む
  void reload() async {
    // 現在のステータスを取得
    final currentState = state;

    List<DocumentSnapshot> docs = (await FirebaseFirestore.instance // ユーザー一覧を取得
        .collection(Const.USERS)
        .orderBy(Const.CREATE, descending: true)
        .get()
    ).docs;

    // 登録するMapを生成
    List<Map<String, dynamic>> userMapList = [];

    for (DocumentSnapshot doc in docs) {
      Map<String, dynamic> map = {
        Const.ID: doc.id,
        Const.USER: doc,
      };

      userMapList.add(map);
    }

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
