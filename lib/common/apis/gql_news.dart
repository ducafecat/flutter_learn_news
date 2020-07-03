import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/graphql/graphql.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:graphql/client.dart';

/// 新闻
class GqlNewsAPI {
  /// 翻页
  static Future<List<GqlNewsResponseEntity>> newsPageList({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    QueryResult response =
        await GraphqlClientUtil.query(context: context, schema: GQL_NEWS_LIST);

    return response.data['newsContents']
        .map<GqlNewsResponseEntity>(
            (item) => GqlNewsResponseEntity.fromJson(item))
        .toList();
  }
}
