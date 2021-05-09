import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:receare/state/shout_create_page/ShoutCreatePageState.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../Const.dart';

class ShoutCreatePageNotifier extends StateNotifier<ShoutCreatePageState> with LocatorMixin {
  ShoutCreatePageNotifier() : super(const ShoutCreatePageState());

  // 初期化
  @override
  void initState() async {
    super.initState();

    state = ShoutCreatePageState(
      enabled: false,
      detailController: TextEditingController(text: ""),
      imageList: [],
      video: null,
      tagListController: TextEditingController(text: ""),
    );
  }

  void setDoc(DocumentSnapshot shoutDoc) async {
    state = ShoutCreatePageState(
      enabled: false,
      detailController: TextEditingController(text: shoutDoc.data()[Const.DETAIL]),
      imageList: [],
      video: null,
      tagListController: TextEditingController(text: ""),
    );
  }

  // 更新
  void setEnabled(bool flag) {
    final currentState = state;

    state = currentState.copyWith( // 更新する
      enabled: flag,
      detailController: currentState.detailController,
      imageList: currentState.imageList,
      video: currentState.video,
      tagListController: currentState.tagListController,
    );
  }

  void setDetail(String detail) {
    final currentState = state;

    state = ShoutCreatePageState(
      enabled: currentState.enabled,
      detailController: TextEditingController(text: detail),
      imageList: currentState.imageList,
      video: currentState.video,
      tagListController: currentState.tagListController,
    );
  }

  void setImage(List<Asset> imageList) {
    final currentState = state;

    state = ShoutCreatePageState(
      enabled: currentState.enabled,
      detailController: currentState.detailController,
      imageList: imageList,
      video: currentState.video,
      tagListController: currentState.tagListController,
    );
  }

  void reset() {
    state = ShoutCreatePageState(
      enabled: false,
      detailController: TextEditingController(text: ""),
      imageList: [],
      video: null,
      tagListController: TextEditingController(text: ""),
    );
  }
}
