import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatefulWidget {
  final NewsItem item;
  DetailsPage({Key key, this.item}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _isPageFinished = false;
  double _webViewHeight = 200;

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
            onPressed: () {
              Share.share('${widget.item.title} ${widget.item.url}');
            },
          ),
        ]);
  }

  // 页标题
  Widget _buildPageTitle() {
    return Container(
      margin: EdgeInsets.all(duSetWidth(10)),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              // 标题
              Text(
                widget.item.category,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.normal,
                  fontSize: duSetFontSize(30),
                  color: AppColors.thirdElement,
                ),
              ),
              // 作者
              Text(
                widget.item.author,
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: duSetFontSize(14),
                  color: AppColors.thirdElementText,
                ),
              ),
            ],
          ),
          Spacer(),
          // 标志
          CircleAvatar(
            //头像半径
            radius: duSetWidth(22),
            backgroundImage: AssetImage("assets/images/channel-fox.png"),
          ),
        ],
      ),
    );
  }

  // 页头部
  Widget _buildPageHeader() {
    return Container(
      margin: EdgeInsets.all(duSetWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图
          imageCached(
            widget.item.thumbnail,
            width: duSetWidth(335),
            height: duSetHeight(290),
          ),
          // 标题
          Container(
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Text(
              widget.item.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          // 一行 3 列
          Container(
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 分类
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    widget.item.category,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryElementText,
                      fontSize: duSetFontSize(14),
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                // 添加时间
                Container(
                  width: duSetWidth(15),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    '• ${duTimeLineFormat(widget.item.addtime)}',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: duSetFontSize(14),
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // web内容
  Widget _buildWebView() {
    return Container(
      height: _webViewHeight,
      child: WebView(
        initialUrl:
            '$SERVER_API_URL/news/content/${widget.item.id}', //widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async {
          _controller.complete(webViewController);

          // String contentBase64 =
          //     base64Encode(const Utf8Encoder().convert(htmlPage));
          // await webViewController.loadUrl('data:text/html;base64,$contentBase64');
        },
        javascriptChannels: <JavascriptChannel>[
          _invokeJavascriptChannel(context),
        ].toSet(),
        navigationDelegate: (NavigationRequest request) {
          if (request.url != '$SERVER_API_URL/news/content/${widget.item.id}') {
            toastInfo(msg: request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          // Timer(Duration(seconds: 1), () {
          //   setState(() {
          //     _isPageFinished = true;
          //   });
          // _removeAd();
          // _getViewHeight();
          // });
        },
        onPageFinished: (String url) {
          _getWebViewHeight();
          setState(() {
            _isPageFinished = true;
          });
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  // 注册js回调
  JavascriptChannel _invokeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Invoke',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
          var webHeight = double.parse(message.message);
          if (webHeight != null) {
            setState(() {
              _webViewHeight = webHeight;
            });
          }
        });
  }

  // 删除广告
  // _removeWebViewAd() async {
  //   await (await _controller.future)?.evaluateJavascript('''
  //       try {
  //         function removeElement(elementName){
  //           let _element = document.getElementById(elementName);
  //           if(!_element) {
  //             _element = document.querySelector(elementName);
  //           }
  //           if(!_element) {
  //             return;
  //           }
  //           let _parentElement = _element.parentNode;
  //           if(_parentElement){
  //               _parentElement.removeChild(_element);
  //           }
  //         }

  //         removeElement('module-engadget-deeplink-top-ad');
  //         removeElement('module-engadget-deeplink-streams');
  //         removeElement('footer');
  //       } catch{}
  //       ''');
  // }

  // 获取页面高度
  _getWebViewHeight() async {
    await (await _controller.future)?.evaluateJavascript('''
        try {
          // Invoke.postMessage([document.body.clientHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight]);
          let scrollHeight = document.documentElement.scrollHeight;
          if (scrollHeight) {
            Invoke.postMessage(scrollHeight);
          }
        } catch {}
        ''');
  }

  // 获取web浏览器像素密度
  // _getWebViewDevicePixelRatio() async {
  //   await (await _controller.future)?.evaluateJavascript('''
  //       try {
  //         Invoke.postMessage(window.devicePixelRatio);
  //       } catch {}
  //       ''');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildPageTitle(),
                  Divider(height: 1),
                  _buildPageHeader(),
                  _buildWebView(),
                ],
              ),
            ),
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
