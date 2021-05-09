import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CommentSenderState.freezed.dart';

// ----------------------------------------
// クラス名　: CommentSenderState
// クラス概要: Comment送信欄State
// ----------------------------------------
@freezed
abstract class CommentSenderState with _$CommentSenderState {
  const factory CommentSenderState({
    @Default(false) bool enabled,
    TextEditingController commentController
  }) = CommentSenderStateData;
}
