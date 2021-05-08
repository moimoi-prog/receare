import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receare/common/CommonModule.dart';
import 'package:receare/state/user_detail_screen/UserDetailPageState.dart';

import '../../strings.dart';

// ------------------------------------
// プロフィールメッセージパーツ
// ------------------------------------
class UserDetailMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserDetailPageState>(context, listen: true).when(
          (userDoc, shoutMapList) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Text(
            registeredKey(userDoc, Strings.MESSAGE) ? userDoc.data()[Strings.MESSAGE] : "",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
      loading: () {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
