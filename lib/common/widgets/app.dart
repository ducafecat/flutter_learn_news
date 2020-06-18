import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: duSetWidth(10),
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
