import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/graphql/graphql.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:graphql/client.dart';

/// 新闻
class GqlNewsAPI {
  /// 首页
  static Future<GqlIndexResponseEntity> indexPageInfo({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    QueryResult response =
        await GraphqlClientUtil.query(context: context, schema: GQL_INDEX_PAGE);

    return GqlIndexResponseEntity.fromJson(response.data);
  }

  /// 翻页
  static Future<List<GqlNewsResponseEntity>> newsPageList({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    QueryResult response = await GraphqlClientUtil.query(
        context: context, schema: GQL_NEWS_LIST, variables: params);

    return response.data['busNews']
        .map<GqlNewsResponseEntity>(
            (item) => GqlNewsResponseEntity.fromJson(item))
        .toList();
  }
}
