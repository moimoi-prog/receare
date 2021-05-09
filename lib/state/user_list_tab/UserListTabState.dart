import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserListTabState.freezed.dart';

// ------------------------------------
// クラス名　: UserListTabState
// クラス概要: ユーザー一覧ページState
// ------------------------------------
@freezed
abstract class UserListTabState with _$UserListTabState {
  const factory UserListTabState({
    @Default([]) List<Map<String, dynamic>> userMapList,
  }) = UserListTabStateData;
  const factory UserListTabState.loading() = UserListTabStateLoading;
}
