import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MainPageState.freezed.dart';

// ----------------------------------------
// クラス名　: MainPageState
// クラス概要: MyEvent一覧タブState
// ----------------------------------------
@freezed
abstract class MainPageState with _$MainPageState {
  const factory MainPageState({
    @Default(0) int myEventTabIndex,
  }) = MainPageStateData;

  const factory MainPageState.loading() = MainPageStateLoading;
}
