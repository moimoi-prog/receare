import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:receare/firebase/AuthModule.dart';
import 'package:receare/firebase/ShoutModule.dart';
import 'package:receare/state/shout_list_screen/ShoutListPageNotifier.dart';

import '../../../strings.dart';

void showShoutListDetailMenuBottomSheet(BuildContext context, DocumentSnapshot shoutDoc) {
  if (shoutDoc.data()[Strings.UID] == user.uid) {
    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            ListTile(
              title: Text("削除する"),
              onTap: () async {
                await deleteShout(shoutId: shoutDoc.id);
                Navigator.of(context).pop();
                Provider.of<ShoutListPageNotifier>(context, listen: false).reload();
                Fluttertoast.showToast(msg: "シャウトを削除しました");
              },
            ),
            ListTile(
              title: Text('キャンセル', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
