import 'package:flutter_ducafecat_news/common/entitys/entitys.dart';
import 'package:flutter_ducafecat_news/common/utils/utils.dart';

/// 新闻
class NewsAPI {
  /// 首页
  static Future<List<NewsIndexResponseEntity>> index() async {
    var response = await HttpUtil().get('/news/index');

    return response.map<NewsIndexResponseEntity>((item) {
      return NewsIndexResponseEntity.fromJson(item);
    }).toList();
  }
}
