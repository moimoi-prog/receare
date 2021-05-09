import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receare/data/ShoutData.dart';

part 'ShoutListTabState.freezed.dart';

// ----------------------------------------
// クラス名　: ShoutListTabState
// クラス概要: Shout一覧ページState
// ----------------------------------------
@freezed
abstract class ShoutListTabState with _$ShoutListTabState {
  const factory ShoutListTabState({
    @Default([]) List<ShoutData> shoutDataList,
  }) = ShoutListTabStateData;
  const factory ShoutListTabState.loading() = ShoutListTabStateLoading;
}
