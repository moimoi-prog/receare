import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'main_screen_state.dart';


// ------------------------------------
// クラス名　: MainScreenNotifier
// クラス概要: Event一覧タブNotifier
// ------------------------------------
class MainScreenNotifier extends StateNotifier<MainScreenState> with LocatorMixin {
  MainScreenNotifier() : super(MainScreenState.loading());

  // 初期化
  void initState() async {
    super.initState();

    state = MainScreenState(myEventTabIndex: 1);
  }

  void setIndex(int i) {
    state = MainScreenState(
      myEventTabIndex: i,
    );
  }

  int getIndex() {
    final currentState = state;

    if (currentState is MainScreenStateData) {
      return currentState.myEventTabIndex;
    } else {
      return 0;
    }
  }
}
