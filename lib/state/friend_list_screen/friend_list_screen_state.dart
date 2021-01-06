import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_list_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: FriendListScreenState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class FriendListScreenState with _$FriendListScreenState {
  const factory FriendListScreenState({
    @Default([]) List<Map<String, dynamic>> friendMapList,
  }) = FriendListScreenStateData;
  const factory FriendListScreenState.loading() = FriendListScreenStateLoading;
}
