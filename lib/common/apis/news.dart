import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';

/// 新闻
class NewsAPI {
  /// 翻页
  static Future<NewsPageListResponseEntity> newsPageList(
      {NewsPageListRequestEntity params}) async {
    var response = await HttpUtil().get('/news', params: params);
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 推荐
  static Future<NewsRecommendResponseEntity> newsRecommend(
      {NewsRecommendRequestEntity params}) async {
    var response = await HttpUtil().get('/news/recommend', params: params);
    return NewsRecommendResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories() async {
    var response = await HttpUtil().get('/categories');
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels() async {
    var response = await HttpUtil().get('/channels');
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags({TagRequestEntity params}) async {
    var response = await HttpUtil().get('/tags', params: params);
    return response
        .map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item))
        .toList();
  }
}
