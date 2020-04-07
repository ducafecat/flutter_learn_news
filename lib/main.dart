import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/provider/provider.dart';
import 'package:flutter_ducafecat_news/global.dart';
import 'package:flutter_ducafecat_news/pages/index/index.dart';
import 'package:flutter_ducafecat_news/routes.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: MyApp(),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      home: IndexPage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );

    // return Consumer<AppState>(
    //   builder: (context, appState, _) {
    //     return MaterialApp(
    //       title: 'ducafecat.tech',
    //       home: appState.isLogin == true ? ApplicationPage() : SignInPage(),
    //       routes: staticRoutes,
    //       debugShowCheckedModeBanner: false,
    //     );
    //   },
    // );
  }
}
