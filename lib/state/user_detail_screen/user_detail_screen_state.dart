import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: UserDetailScreenState
// クラス概要: UserDetailScreenState
// ----------------------------------------
@freezed
abstract class UserDetailScreenState with _$UserDetailScreenState {
  const factory UserDetailScreenState({
    DocumentSnapshot userDoc, // Userドキュメント
    @Default([]) List<Map<String, dynamic>> shoutMapList, // Shoutコレクション
  }) = UserDetailScreenStateData;

  const factory UserDetailScreenState.loading() = UserDetailScreenStateLoading;
}
