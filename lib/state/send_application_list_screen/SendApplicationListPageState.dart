import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SendApplicationListPageState.freezed.dart';

// ----------------------------------------
// クラス名　: SendApplicationListPageState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class SendApplicationListPageState with _$SendApplicationListPageState {
  const factory SendApplicationListPageState({
    @Default([]) List<Map<String, dynamic>> sendMapList,
  }) = SendApplicationListPageStateData;
  const factory SendApplicationListPageState.loading() = SendApplicationListPageStateLoading;
}
