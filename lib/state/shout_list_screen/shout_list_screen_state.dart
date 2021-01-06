import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shout_list_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: ShoutListScreenState
// クラス概要: Shout一覧タブState
// ----------------------------------------
@freezed
abstract class ShoutListScreenState with _$ShoutListScreenState {
  const factory ShoutListScreenState({
    @Default([]) List<Map<String, dynamic>> shoutMapList,
  }) = ShoutListScreenStateData;
  const factory ShoutListScreenState.loading() = ShoutListScreenStateLoading;
}
