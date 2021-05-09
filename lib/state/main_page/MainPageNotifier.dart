import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'MainPageState.dart';


// ------------------------------------
// クラス名　: MainPageNotifier
// クラス概要: Event一覧タブNotifier
// ------------------------------------
class MainPageNotifier extends StateNotifier<MainPageState> with LocatorMixin {
  MainPageNotifier() : super(MainPageState.loading());

  // 初期化
  void initState() async {
    super.initState();

    state = MainPageState(myEventTabIndex: 1);
  }

  void setIndex(int i) {
    state = MainPageState(
      myEventTabIndex: i,
    );
  }

  int getIndex() {
    final currentState = state;

    if (currentState is MainPageStateData) {
      return currentState.myEventTabIndex;
    } else {
      return 0;
    }
  }
}
