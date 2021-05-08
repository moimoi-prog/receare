import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserListPageState.freezed.dart';

// ----------------------------------------
// クラス名　: UserListPageState
// クラス概要: USer一覧タブState
// ----------------------------------------
@freezed
abstract class UserListPageState with _$UserListPageState {
  const factory UserListPageState({
    @Default([]) List<Map<String, dynamic>> userMapList,
  }) = UserListPageStateData;
  const factory UserListPageState.loading() = UserListPageStateLoading;
}
