import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_state.freezed.dart';

// ----------------------------------------
// クラス名　: MainScreenState
// クラス概要: MyEvent一覧タブState
// ----------------------------------------
@freezed
abstract class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(0) int myEventTabIndex,
  }) = MainScreenStateData;

  const factory MainScreenState.loading() = MainScreenStateLoading;
}
