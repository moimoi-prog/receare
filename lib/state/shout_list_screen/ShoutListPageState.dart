import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ShoutListPageState.freezed.dart';

// ----------------------------------------
// クラス名　: ShoutListPageState
// クラス概要: Shout一覧タブState
// ----------------------------------------
@freezed
abstract class ShoutListPageState with _$ShoutListPageState {
  const factory ShoutListPageState({
    @Default([]) List<Map<String, dynamic>> shoutMapList,
  }) = ShoutListPageStateData;
  const factory ShoutListPageState.loading() = ShoutListPageStateLoading;
}
