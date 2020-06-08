import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/provider/provider.dart';
import 'package:flutter_ducafecat_news/common/router/auth_grard.dart';
import 'package:flutter_ducafecat_news/common/router/router.gr.dart';
import 'package:flutter_ducafecat_news/global.dart';
import 'package:provider/provider.dart';
import 'package:sentry/sentry.dart';

// 创建 SentryClient 用于将异常日志上报给 sentry 平台
final SentryClient _sentry = new SentryClient(
  dsn:
      'https://8c0adcc4ba9341b9b555cfb455e7074d@o402094.ingest.sentry.io/5262754',
);

// 是否开发环境
bool get isInDebugMode {
  return false; // false 开始上传 sentry
}

// 上报异常的函数
Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');
  if (isInDebugMode) {
    print(stackTrace);
  } else {
    final SentryResponse response = await _sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );

    if (response.isSuccessful) {
      print('Success! Event ID: ${response.eventId}');
    } else {
      print('Failed to report to Sentry.io: ${response.error}');
    }
  }
}

Future<Null> main() async {
  // 捕获并上报 Flutter 异常
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode == true) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  // 捕获并上报 Dart 异常
  runZonedGuarded(() async {
    await Global.init();
    runApp(
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
              child: NewsApp(),
            );
          } else {
            return NewsApp();
          }
        }),
      ),
    );
  }, (Object error, StackTrace stack) {
    _reportError(error, stack);
  });
}

class NewsApp extends StatelessWidget {
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
