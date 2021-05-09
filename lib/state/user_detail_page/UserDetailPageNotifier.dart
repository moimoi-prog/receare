import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receare/state/user_detail_page/UserDetailPageState.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Strings.dart';

// ------------------------------------
// クラス名　: UserDetailPageNotifier
// クラス概要: Shout一覧タブNotifier
// ------------------------------------
class UserDetailPageNotifier extends StateNotifier<UserDetailPageState> with LocatorMixin {
  UserDetailPageNotifier() : super(UserDetailPageState.loading());

  void initState() async {
    super.initState();
  }

  // 全データ読込
  Future<void> load(String uid) async {
    final currentState = state;

    // user情報を取得
    DocumentSnapshot userDoc = (await FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).get());

    // shout情報を取得
    QuerySnapshot shoutQuery = (await FirebaseFirestore.instance.collection(Strings.SHOUTS).where(Strings.UID, isEqualTo: uid).orderBy(Strings.UPDATE, descending: true).get());

    // 登録するMapを生成
    List<Map<String, dynamic>> shoutMapList = [];

    for (DocumentSnapshot doc in shoutQuery.docs) {
      Map<String, dynamic> map = {
        Strings.ID: doc.id,
        Strings.SHOUT: doc,
        Strings.UID: doc.data()[Strings.UID],
        Strings.DETAIL: doc.data()[Strings.DETAIL],
        Strings.IMAGE_PATH: doc.data()[Strings.IMAGE_PATH],
        Strings.COMMENTS: null,
        Strings.CREATE: doc.data()[Strings.CREATE],
        Strings.READ: doc.data()[Strings.READ],
        Strings.UPDATE: doc.data()[Strings.UPDATE],
        Strings.DELETE: doc.data()[Strings.DELETE],
      };

      shoutMapList.add(map);
    }

    if (currentState is UserDetailPageStateData) {
      // stateを更新
      state = currentState.copyWith(
        userDoc: userDoc,
        shoutMapList: shoutMapList,
      );
    } else {
      state = UserDetailPageState(
        userDoc: userDoc,
        shoutMapList: shoutMapList,
      );
    }
  }

  // Shout読込
  Future<void> loadUser(String uid) async {
    final currentState = state;

    if (currentState is UserDetailPageStateData) {
      // user情報を取得
      DocumentSnapshot userDoc = (await FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).get());

      // stateを更新
      state = currentState.copyWith(
        userDoc: userDoc,
        shoutMapList: currentState.shoutMapList,
      );
    }
  }

  // Shout読込
  Future<void> loadShout(String uid) async {
    final currentState = state;

    if (currentState is UserDetailPageStateData) {
      // shout情報を取得
      QuerySnapshot shoutQuery = (await FirebaseFirestore.instance.collection(Strings.SHOUTS).where(Strings.UID, isEqualTo: uid).orderBy(Strings.UPDATE, descending: true).get());

      // 登録するMapを生成
      List<Map<String, dynamic>> shoutMapList = [];

      for (DocumentSnapshot doc in shoutQuery.docs) {
        Map<String, dynamic> map = {
          Strings.ID: doc.id,
          Strings.SHOUT: doc,
          Strings.UID: doc.data()[Strings.UID],
          Strings.DETAIL: doc.data()[Strings.DETAIL],
          Strings.IMAGE_PATH: doc.data()[Strings.IMAGE_PATH],
          Strings.COMMENTS: null,
          Strings.CREATE: doc.data()[Strings.CREATE],
          Strings.READ: doc.data()[Strings.READ],
          Strings.UPDATE: doc.data()[Strings.UPDATE],
          Strings.DELETE: doc.data()[Strings.DELETE],
        };

        shoutMapList.add(map);
      }

      // stateを更新
      state = currentState.copyWith(
        userDoc: currentState.userDoc,
        shoutMapList: shoutMapList,
      );
    }
  }

  // 全データ読込
  Future<void> reloadShout() async {
    final currentState = state;

    if (currentState is UserDetailPageStateData) {
      // shout情報を取得
      QuerySnapshot shoutQuery = (await FirebaseFirestore.instance
          .collection(Strings.SHOUTS)
          .where(Strings.UID, isEqualTo: currentState.userDoc.id)
          .orderBy(Strings.UPDATE, descending: true)
          .get());

      // 登録するMapを生成
      List<Map<String, dynamic>> shoutMapList = [];

      for (DocumentSnapshot doc in shoutQuery.docs) {
        Map<String, dynamic> map = {
          Strings.ID: doc.id,
          Strings.SHOUT: doc,
          Strings.UID: doc.data()[Strings.UID],
          Strings.DETAIL: doc.data()[Strings.DETAIL],
          Strings.IMAGE_PATH: doc.data()[Strings.IMAGE_PATH],
          Strings.COMMENTS: null,
          Strings.CREATE: doc.data()[Strings.CREATE],
          Strings.READ: doc.data()[Strings.READ],
          Strings.UPDATE: doc.data()[Strings.UPDATE],
          Strings.DELETE: doc.data()[Strings.DELETE],
        };

        shoutMapList.add(map);
      }

      // stateを更新
      state = currentState.copyWith(
        userDoc: currentState.userDoc,
        shoutMapList: shoutMapList,
      );
    }
  }

  // 初期化
  void reset() {
    if (state is UserDetailPageStateData) {
      state = UserDetailPageState.loading();
    }
  }
}
