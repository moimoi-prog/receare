import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReceptionApplicationListPageState.freezed.dart';

// ----------------------------------------
// クラス名　: ReceptionApplicationListPageState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class ReceptionApplicationListPageState with _$ReceptionApplicationListPageState {
  const factory ReceptionApplicationListPageState({
    @Default([]) List<Map<String, dynamic>> receptionMapList,
  }) = ReceptionApplicationListPageStateData;
  const factory ReceptionApplicationListPageState.loading() = ReceptionApplicationListPageStateLoading;
}
