import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';

/// 新闻
class NewsAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<NewsPageListResponseEntity> newsPageList({
    NewsPageListRequestEntity params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news',
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 推荐
  static Future<NewsRecommendResponseEntity> newsRecommend({
    NewsRecommendRequestEntity params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news/recommend',
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return NewsRecommendResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/categories',
      cacheDisk: cacheDisk,
    );
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels({
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/channels',
      cacheDisk: cacheDisk,
    );
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags({
    TagRequestEntity params,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/tags',
      params: params?.toJson(),
      cacheDisk: cacheDisk,
    );
    return response
        .map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item))
        .toList();
  }
}
