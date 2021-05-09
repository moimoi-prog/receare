import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'FriendListPageState.freezed.dart';

// ----------------------------------------
// クラス名　: FriendListPageState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class FriendListPageState with _$FriendListPageState {
  const factory FriendListPageState({
    @Default([]) List<Map<String, dynamic>> friendMapList,
  }) = FriendListPageStateData;
  const factory FriendListPageState.loading() = FriendListPageStateLoading;
}
