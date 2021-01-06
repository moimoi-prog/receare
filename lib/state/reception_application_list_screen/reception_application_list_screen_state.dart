import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reception_application_list_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: ReceptionApplicationListScreenState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class ReceptionApplicationListScreenState with _$ReceptionApplicationListScreenState {
  const factory ReceptionApplicationListScreenState({
    @Default([]) List<Map<String, dynamic>> receptionMapList,
  }) = ReceptionApplicationListScreenStateData;
  const factory ReceptionApplicationListScreenState.loading() = ReceptionApplicationListScreenStateLoading;
}
