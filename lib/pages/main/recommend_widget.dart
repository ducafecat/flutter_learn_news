import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';

// 推荐阅读
Widget recommendWidget(NewsRecommendResponseEntity newsRecommend) {
  return Container(
    height: duSetHeight(490),
    // color: Colors.amber,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        imageCached(
          newsRecommend.thumbnail,
          height: 290,
          width: 335,
          margin: EdgeInsets.fromLTRB(
              duSetWidth(20), duSetWidth(20), duSetWidth(20), 0),
        ),
        // 作者
        Container(
          margin: EdgeInsets.fromLTRB(duSetWidth(20), duSetWidth(14), 0, 0),
          child: Text(
            newsRecommend.author,
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
            newsRecommend.title,
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
                  newsRecommend.category,
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
                  '•   ${TimelineUtil.formatByDateTime(newsRecommend.addtime, locale: 'en', dayFormat: DayFormat.Simple)}',
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
