import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';

/// 第三方按钮
Widget btnThirdSocialWidget(String fileName) {
  return Container(
    width: duSetWidth(88),
    height: duSetHeight(44),
    child: FlatButton(
      onPressed: () => {},
      shape: RoundedRectangleBorder(
        side: Borders.primaryBorder,
        borderRadius: Radii.k6pxRadius,
      ),
      child: Image.asset(
        "assets/images/icons-$fileName.png",
      ),
    ),
  );
}
