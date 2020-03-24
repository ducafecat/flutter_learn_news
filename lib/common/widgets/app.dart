import 'package:flutter/material.dart';

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
    title: Center(
      child: title,
    ),
    leading: leading,
    actions: actions,
  );
}
