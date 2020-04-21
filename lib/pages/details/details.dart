import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatefulWidget {
  final String url;
  DetailsPage({Key key, this.url}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _isPageFinished = false;

  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          ),
        ]);
  }

  // web内容
  Widget _buildWebView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) async {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        // 禁止点击去别的url
        if (request.url != widget.url) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {
        setState(() {
          _isPageFinished = true;
        });
        _removeAd();
      },
      gestureNavigationEnabled: true,
    );
  }

  // 删除广告
  _removeAd() async {
    await (await _controller.future).evaluateJavascript('''
        document.getElementById('module-engadget-deeplink-top-ad').style.display="none";
        document.getElementById('module-engadget-deeplink-streams').style.display="none";
        ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: <Widget>[
            _buildWebView(),
            _isPageFinished == true
                ? Container()
                : Align(
                    alignment: Alignment.center,
                    child: LoadingBouncingGrid.square(),
                  ),
          ],
        ));
  }
}
