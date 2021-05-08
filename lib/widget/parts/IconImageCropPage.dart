import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receare/pub/simple_image_crop.dart';

// ----------------------------------------
// アイコン画像切り取り画面
// ----------------------------------------
class IconImageCropPage extends StatelessWidget {
  final cropKey = GlobalKey<ImgCropState>();
  final File image;

  IconImageCropPage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'プロフィール画像を選択',
        ),
        leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: ImgCrop(
                  key: cropKey,
                  chipRadius: 100,
                  chipShape: ChipShape.circle,
                  // chipRatio: 2 / 1,
                  // maximumScale: 3,
                  image: FileImage(image),
                  // handleSize: 0.0,
                ),
              ),
            ),
            RaisedButton(
              child: Text("決定"),
              onPressed: () async {
                // 画像を円形に切り取る
                final crop = cropKey.currentState;
                final croppedFile = await crop.cropCompleted(image, preferredSize: 1000);

                Navigator.of(context).pop(croppedFile);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<Null> showImage(BuildContext context, File file) async {
    return showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Current screenshot：',
          ),
          content: ClipOval(
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              child: Container(
                width: 110.0,
                height: 110.0,
                child: Image.file(file),
              ),
            ),
          ),
        );
      },
    );
  }
}
