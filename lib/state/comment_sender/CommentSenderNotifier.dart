import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'CommentSenderState.dart';

// ------------------------------------
// クラス名　: CommentSenderNotifier
// クラス概要: Comment送信蘭Notifier
// ------------------------------------
class CommentSenderNotifier extends StateNotifier<CommentSenderState> with LocatorMixin {
  CommentSenderNotifier() : super(CommentSenderStateData());

  // 初期化
  void initState() {
    super.initState(); // 親クラスの初期化処理を呼び出す

    state = CommentSenderState(
      // 初期化する
      enabled: false,
      commentController: TextEditingController(text: ""),
    );
  }

  // --------------------------------
  // メソッド名 : setEnabled
  // 処理概要　 : 送信ボタンの活性化状態を更新する
  // --------------------------------
  void setEnabled(bool flag) {
    final currentState = state;

    state = currentState.copyWith(
      enabled: flag,
      commentController: currentState.commentController,
    );
  }

  // --------------------------------
  // メソッド名 : reset
  // 処理概要　 : リセットする
  // --------------------------------
  void reset() {
    final currentState = state;

    state = currentState.copyWith(
      enabled: false,
      commentController: TextEditingController(text: ""),
    );
  }
}
