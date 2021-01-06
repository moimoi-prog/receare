import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: UserListScreenState
// クラス概要: USer一覧タブState
// ----------------------------------------
@freezed
abstract class UserListScreenState with _$UserListScreenState {
  const factory UserListScreenState({
    @Default([]) List<Map<String, dynamic>> userMapList,
  }) = UserListScreenStateData;
  const factory UserListScreenState.loading() = UserListScreenStateLoading;
}
