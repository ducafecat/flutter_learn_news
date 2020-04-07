import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/global.dart';
import 'package:flutter_ducafecat_news/pages/application/application.dart';
import 'package:flutter_ducafecat_news/pages/sign_in/sign_in.dart';
import 'package:flutter_ducafecat_news/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );

    return Scaffold(
      body: Global.isFirstOpen == true
          ? WelcomePage()
          : Global.isOfflineLogin == true ? ApplicationPage() : SignInPage(),
    );
  }
}
