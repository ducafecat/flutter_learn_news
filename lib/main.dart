import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/provider/provider.dart';
import 'package:flutter_ducafecat_news/common/router/auth_grard.dart';
import 'package:flutter_ducafecat_news/common/router/router.gr.dart';
import 'package:flutter_ducafecat_news/global.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: Consumer<AppState>(builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
              child: MyApp(),
            );
          } else {
            return MyApp();
          }
        }),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<AppRouter>(
        initialRoute: Routes.indexPageRoute,
        router: AppRouter(),
        guards: [AuthGuard()],
      ),
    );
  }
}
