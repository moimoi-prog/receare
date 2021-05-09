import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:receare/widget/image_detail_page/ImageDetailPage.dart';

import '../../../Strings.dart';

// --------------------------------
// クラス名 　: ShoutListDetailImage
// クラス概要 : シャウト画像表示
// --------------------------------
class ShoutListDetailImage extends StatelessWidget {
  final QuerySnapshot query;

  ShoutListDetailImage({Key key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: width / 2.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.grey,
        ),
        child: Container(
          child: _child(context, query),
        ),
      ),
    );
  }

// --------------------------------
// メソッド名 :
// 処理概要　 :
// --------------------------------
  Widget _child(BuildContext context, QuerySnapshot query) {
    switch (query.size) {
      case 1:
        return _image1(context, query);
        break;

      case 2:
        return _image2(context, query);
        break;

      case 3:
        return _image3(context, query);
        break;

      case 4:
        return _image4(context, query);
        break;
    }
  }

// --------------------------------
// メソッド名 : _image1
// 処理概要　 : シャウト画像1枚表示
// --------------------------------
  Widget _image1(BuildContext context, QuerySnapshot query) {
    return _image(context, query.docs[0]);
  }

// --------------------------------
// メソッド名 : _image2
// 処理概要　 : シャウト画像2枚表示
// --------------------------------
  Widget _image2(BuildContext context, QuerySnapshot query) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: 2.0,
              ),
              child: _image(context, query.docs[0]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 2.0,
              ),
              child: _image(context, query.docs[1]),
            ),
          ),
        ],
      ),
    );
  }

// --------------------------------
// メソッド名 : _image3
// 処理概要　 : シャウト画像3枚表示
// --------------------------------
  Widget _image3(BuildContext context, QuerySnapshot query) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: 2.0,
              ),
              child: _image(context, query.docs[0]),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 2.0,
                      left: 2.0,
                    ),
                    child: _image(context, query.docs[1]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 2.0,
                      left: 2.0,
                    ),
                    child: _image(context, query.docs[2]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// --------------------------------
// メソッド名 : _image4
// 処理概要　 : シャウト画像4枚表示
// --------------------------------
  Widget _image4(BuildContext context, QuerySnapshot query) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 2.0,
                      bottom: 2.0,
                    ),
                    child: _image(context, query.docs[0]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 2.0,
                      left: 2.0,
                    ),
                    child: _image(context, query.docs[1]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 2.0,
                      right: 2.0,
                    ),
                    child: _image(context, query.docs[2]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 2.0,
                      top: 2.0,
                    ),
                    child: _image(context, query.docs[3]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// --------------------------------
// メソッド名 : _image
// 処理概要　 : シャウト画像
// --------------------------------
  Widget _image(BuildContext context, DocumentSnapshot doc) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ImageDetailPage(
                path: doc.data()[Strings.PATH],
              );
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              doc.data()[Strings.PATH],
            ),
          ),
        ),
      ),
    );
  }
}
