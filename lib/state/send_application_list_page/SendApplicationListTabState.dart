import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SendApplicationListTabState.freezed.dart';

// ----------------------------------------
// クラス名　: SendApplicationListTabState
// クラス概要: Friend一覧タブState
// ----------------------------------------
@freezed
abstract class SendApplicationListTabState with _$SendApplicationListTabState {
  const factory SendApplicationListTabState({
    @Default([]) List<Map<String, dynamic>> sendMapList,
  }) = SendApplicationListTabStateData;
  const factory SendApplicationListTabState.loading() = SendApplicationListTabStateLoading;
}
