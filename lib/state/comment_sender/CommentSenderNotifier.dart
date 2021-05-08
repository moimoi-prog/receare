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

    state = CommentSenderState( // 初期化する
        enabled: false,
        commentController: TextEditingController(text: "")
    );
  }

  // 更新
  void change(bool flag) {
    final currentState = state;

    state = currentState.copyWith( // 更新する
        enabled: flag,
        commentController: currentState.commentController
    );
  }

  // 更新
  void reset() {
    final currentState = state;

    state = currentState.copyWith( // 初期化する
        enabled: false,
        commentController: TextEditingController(text: "")
    );
  }

  // テキストを取得
  String getText() {
    return state.commentController.text;
  }
}
