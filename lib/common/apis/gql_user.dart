import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/graphql/graphql.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';
import 'package:graphql/client.dart';

/// 新闻
class GqlUserAPI {
  /// 登录
  static Future<GqlUserLoginResponseEntity> login({
    @required BuildContext context,
    @required GqlUserLoginRequestEntity variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_LOGIN,
        variables: variables.toJson());

    return GqlUserLoginResponseEntity.fromJson(response.data["login"]);
  }

  /// 注册
  static Future<GqlUserRegisterResponseEntity> register({
    @required BuildContext context,
    @required GqlUserRegisterRequestEntity variables,
  }) async {
    QueryResult response = await GraphqlClientUtil.mutate(
        context: context,
        schema: GQL_USER_REGISTER,
        variables: variables.toJson());

    return GqlUserRegisterResponseEntity.fromJson(response.data["register"]);
  }
}
