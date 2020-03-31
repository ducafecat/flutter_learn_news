/// 新闻分页 request
class NewsPageListRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsPageListRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });

  Map<String, dynamic> toJson() => {
        "categoryCode": categoryCode,
        "channelCode": channelCode,
        "tag": tag,
        "keyword": keyword,
      };
}

/// 新闻分页 response
class NewsPageListResponseEntity {
  int counts;
  int pagesize;
  int pages;
  int page;
  List<NewsItem> items;

  NewsPageListResponseEntity({
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  factory NewsPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsPageListResponseEntity(
        counts: json["counts"],
        pagesize: json["pagesize"],
        pages: json["pages"],
        page: json["page"],
        items:
            List<NewsItem>.from(json["items"].map((x) => NewsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "counts": counts,
        "pagesize": pagesize,
        "pages": pages,
        "page": page,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class NewsItem {
  String id;
  String title;
  String category;
  String thumbnail;
  String author;
  DateTime addtime;
  String url;

  NewsItem({
    this.id,
    this.title,
    this.category,
    this.thumbnail,
    this.author,
    this.addtime,
    this.url,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) => NewsItem(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        author: json["author"],
        addtime: DateTime.parse(json["addtime"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "thumbnail": thumbnail,
        "author": author,
        "addtime": addtime.toIso8601String(),
        "url": url,
      };
}

/// 新闻推荐 request
class NewsRecommendRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsRecommendRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });

  Map<String, dynamic> toJson() => {
        "categoryCode": categoryCode,
        "channelCode": channelCode,
        "tag": tag,
        "keyword": keyword,
      };
}

/// 新闻推荐 response
class NewsRecommendResponseEntity {
  String thumbnail;
  String title;
  String category;
  DateTime addtime;
  String author;
  String url;
  String id;

  NewsRecommendResponseEntity({
    this.thumbnail,
    this.title,
    this.category,
    this.addtime,
    this.author,
    this.url,
    this.id,
  });

  factory NewsRecommendResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsRecommendResponseEntity(
        thumbnail: json["thumbnail"],
        title: json["title"],
        category: json["category"],
        addtime: DateTime.parse(json["addtime"]),
        author: json["author"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "title": title,
        "category": category,
        "addtime": addtime.toIso8601String(),
        "author": author,
        "url": url,
        "id": id,
      };
}
