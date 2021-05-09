import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReceptionApplicationListTabState.freezed.dart';

// ----------------------------------------
// クラス名　: ReceptionApplicationListTabState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class ReceptionApplicationListTabState with _$ReceptionApplicationListTabState {
  const factory ReceptionApplicationListTabState({
    @Default([]) List<Map<String, dynamic>> receptionMapList,
  }) = ReceptionApplicationListTabStateData;
  const factory ReceptionApplicationListTabState.loading() = ReceptionApplicationListTabStateLoading;
}
