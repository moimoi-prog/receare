import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:receare/state/shout_create_screen/shout_create_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../strings.dart';

class ShoutCreateScreenNotifier extends StateNotifier<ShoutCreateScreenState> with LocatorMixin {
  ShoutCreateScreenNotifier() : super(const ShoutCreateScreenState());

  // 初期化
  @override
  void initState() async {
    super.initState();

    state = ShoutCreateScreenState(
      detail: "",
      imageList: [],
      video: null,
      tagListController: TextEditingController(text: ""),
    );
  }

  void setDoc(DocumentSnapshot shoutDoc) async {
    state = ShoutCreateScreenState(
      detail: shoutDoc.data()[Strings.DETAIL],
      imageList: [],
      video: null,
      tagListController: TextEditingController(text: ""),
    );
  }

  bool judge() {
    return state.detail != "";
  }

  void setDetail(String detail) {
    final currentState = state;

    state = ShoutCreateScreenState(
      detail: detail,
      imageList: currentState.imageList,
      video: currentState.video,
      tagListController: currentState.tagListController,
    );
  }

  void setImage(List<Asset> imageList) {
    final currentState = state;

    state = ShoutCreateScreenState(
      detail: currentState.detail,
      imageList: imageList,
      video: currentState.video,
      tagListController: currentState.tagListController,
    );
  }

  void reset() {
    state = ShoutCreateScreenState(
      detail: "",
      imageList: [],
      video: null,
      tagListController: TextEditingController(text: ""),
    );
  }
}
