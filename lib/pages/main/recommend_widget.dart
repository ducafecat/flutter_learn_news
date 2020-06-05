import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/router/router.gr.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';

/// 推荐阅读
Widget recommendWidget(NewsItem item) {
  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        InkWell(
          onTap: () {
            ExtendedNavigator.rootNavigator.pushNamed(
              Routes.detailsPageRoute,
              arguments: DetailsPageArguments(item: item),
            );
          },
          child: imageCached(
            item.thumbnail,
            width: duSetWidth(335),
            height: duSetHeight(290),
          ),
        ),
        // 作者
        Container(
          margin: EdgeInsets.only(top: duSetHeight(14)),
          child: Text(
            item.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
              fontSize: duSetFontSize(14),
            ),
          ),
        ),
        // 标题
        InkWell(
          onTap: () {
            ExtendedNavigator.rootNavigator.pushNamed(
              Routes.detailsPageRoute,
              arguments: DetailsPageArguments(item: item),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Text(
              item.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
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
                  item.category,
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
                  '• ${duTimeLineFormat(item.addtime)}',
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
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
