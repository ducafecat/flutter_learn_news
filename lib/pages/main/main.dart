import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/apis/apis.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/timeline.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';
import 'package:flutter_ducafecat_news/pages/main/categories_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode; // 选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _newsRecommend = await NewsAPI.newsRecommend();
    _newsPageList = await NewsAPI.newsPageList();

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return newsCategoriesWidget(
      categories: _categories,
      selCategoryCode: _selCategoryCode,
      onTap: (CategoryResponseEntity item) {
        setState(() {
          _selCategoryCode = item.code;
        });
      },
    );
  }
  // 抽取前先实现业务
  // Widget _buildCategories() {
  //   return _categories == null
  //       ? Container()
  //       : SingleChildScrollView(
  //           scrollDirection: Axis.horizontal,
  //           child: Row(
  //             children: _categories.map<Widget>((item) {
  //               return Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 8),
  //                 child: GestureDetector(
  //                   child: Text(
  //                     item.title,
  //                     style: TextStyle(
  //                       color: _selCategoryCode == item.code
  //                           ? AppColors.secondaryElementText
  //                           : AppColors.primaryText,
  //                       fontSize: duSetFontSize(18),
  //                       fontFamily: 'Montserrat',
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                   onTap: () {
  //                     setState(() {
  //                       _selCategoryCode = item.code;
  //                     });
  //                   },
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         );
  // }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null // 数据没到位，可以用骨架图展示
        ? Container(
            height: duSetHeight(490),
          )
        : Container(
            height: duSetHeight(490),
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 图
                imageCached(
                  _newsRecommend.thumbnail,
                  height: 290,
                  width: 335,
                  margin: EdgeInsets.fromLTRB(
                      duSetWidth(20), duSetWidth(20), duSetWidth(20), 0),
                ),
                // 作者
                Container(
                  margin:
                      EdgeInsets.fromLTRB(duSetWidth(20), duSetWidth(14), 0, 0),
                  child: Text(
                    _newsRecommend.author,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: duSetFontSize(14),
                    ),
                  ),
                ),
                // 标题
                Container(
                  margin: EdgeInsets.fromLTRB(
                      duSetWidth(20), duSetWidth(10), duSetWidth(20), 0),
                  child: Text(
                    _newsRecommend.title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                      fontSize: duSetFontSize(24),
                      height: 1,
                    ),
                  ),
                ),
                // Spacer
                Spacer(),
                // 一行 3 列
                Container(
                  height: duSetHeight(19.0 + 20), // 字高度+底部Margin
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 分类
                      Container(
                        margin: EdgeInsets.only(left: duSetWidth(20)),
                        child: Text(
                          _newsRecommend.category,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.secondaryElementText,
                            fontSize: duSetFontSize(14),
                            height: 1,
                          ),
                        ),
                      ),
                      // 添加时间
                      Container(
                        margin: EdgeInsets.only(left: duSetWidth(15)),
                        child: Text(
                          '•   ${TimelineUtil.formatByDateTime(_newsRecommend.addtime, locale: 'en', dayFormat: DayFormat.Simple)}',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.thirdElementText,
                            fontSize: duSetFontSize(14),
                            height: 1,
                          ),
                        ),
                      ),
                      // 更多
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          color: AppColors.primaryText,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  // 频道
  Widget _buildChannels() {
    return Container(
      height: duSetHeight(137),
      color: Colors.blueAccent,
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return Container(
      height: duSetHeight(161 * 5 + 100.0),
      color: Colors.purple,
    );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return Container(
      height: duSetHeight(259),
      color: Colors.brown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
