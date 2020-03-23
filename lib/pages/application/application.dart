import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';
import 'package:flutter_ducafecat_news/pages/main/main.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  String _title = 'Welcome';
  PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.primaryText,
      ),
      title: Text('main'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColors.primaryText,
      ),
      title: Text('category'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColors.primaryText,
      ),
      title: Text('tag'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColors.primaryText,
      ),
      title: Text('my'),
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
      switch (page) {
        case 0:
          _title = 'Welcome';
          break;
        case 1:
          _title = 'Cagegory';
          break;
        case 2:
          _title = 'Tag';
          break;
        case 3:
          _title = 'My';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
      context: context,
      title: Text(
        _title,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        MainPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      fixedColor: AppColors.secondaryElementText,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
