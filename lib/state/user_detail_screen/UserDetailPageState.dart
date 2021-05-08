import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserDetailPageState.freezed.dart';

// ----------------------------------------
// クラス名　: UserDetailPageState
// クラス概要: UserDetailScreenState
// ----------------------------------------
@freezed
abstract class UserDetailPageState with _$UserDetailPageState {
  const factory UserDetailPageState({
    DocumentSnapshot userDoc, // Userドキュメント
    @Default([]) List<Map<String, dynamic>> shoutMapList, // Shoutコレクション
  }) = UserDetailPageStateData;

  const factory UserDetailPageState.loading() = UserDetailPageStateLoading;
}
