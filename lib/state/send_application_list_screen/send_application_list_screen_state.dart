import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_application_list_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: SendApplicationListScreenState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class SendApplicationListScreenState with _$SendApplicationListScreenState {
  const factory SendApplicationListScreenState({
    @Default([]) List<Map<String, dynamic>> sendMapList,
  }) = SendApplicationListScreenStateData;
  const factory SendApplicationListScreenState.loading() = SendApplicationListScreenStateLoading;
}
