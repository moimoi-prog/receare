import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

part 'ShoutCreatePageState.freezed.dart';

@freezed
abstract class ShoutCreatePageState with _$ShoutCreatePageState {
  const factory ShoutCreatePageState({
    String detail, // 内容
    @Default([]) List<Asset> imageList, // 画像一覧
    File video, // 動画
    TextEditingController tagListController // タグ一覧
  }) = ShoutCreatePageStateData;
}
