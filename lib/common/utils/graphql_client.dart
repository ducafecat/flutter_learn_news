import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/values/values.dart';
import 'package:flutter_ducafecat_news/common/widgets/widgets.dart';
import 'package:graphql/client.dart';

class GraphqlClientUtil {
  static OptimisticCache cache = OptimisticCache(
    dataIdFromObject: typenameDataIdFromObject,
  );

  static client() {
    HttpLink _httpLink = HttpLink(
      uri: '$SERVER_STRAPI_GRAPHQL_URL/graphql',
    );

    // final AuthLink _authLink = AuthLink(
    //   getToken: () =>
    //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlZmMzNDdhYzgzOTVjMDAwY2ViYzE5NyIsImlhdCI6MTU5MzY1NDcwNiwiZXhwIjoxNTk2MjQ2NzA2fQ.RYDmNSDJxcZLLPHAf4u59IER7Bs5VoWfBo1_t-TR5yY',
    // );

    // final Link _link = _authLink.concat(_httpLink);

    return GraphQLClient(
      cache: cache,
      link: _httpLink,
    );
  }

  // 查询
  static Future query({
    @required BuildContext context,
    @required String schema,
    Map<String, dynamic> variables,
  }) async {
    QueryOptions options = QueryOptions(
      documentNode: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().query(options);

    if (result.hasException) {
      toastInfo(msg: result.exception.toString());
      throw result.exception;
    }

    return result;
  }

  // 操作
  static Future mutate({
    @required BuildContext context,
    @required String schema,
    Map<String, dynamic> variables,
  }) async {
    QueryOptions options = QueryOptions(
      documentNode: gql(schema),
      variables: variables,
    );

    QueryResult result = await client().mutate(options);

    if (result.hasException) {
      toastInfo(msg: result.exception.toString());
      throw result.exception;
    }

    return result;
  }
}
