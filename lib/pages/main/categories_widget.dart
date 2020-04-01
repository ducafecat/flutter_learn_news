import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';

/// 分类导航
Widget newsCategoriesWidget({
  List<CategoryResponseEntity> categories,
  String selCategoryCode,
  Function(CategoryResponseEntity) onTap,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categories.map<Widget>((item) {
        return Container(
          alignment: Alignment.center,
          height: duSetHeight(52),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            child: Text(
              item.title,
              style: TextStyle(
                color: selCategoryCode == item.code
                    ? AppColors.secondaryElementText
                    : AppColors.primaryText,
                fontSize: duSetFontSize(18),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => onTap(item),
          ),
        );
      }).toList(),
    ),
  );
}
