/// 新闻首页 response
class NewsIndexResponseEntity {
  String title;
  String url;

  NewsIndexResponseEntity({
    this.title,
    this.url,
  });

  factory NewsIndexResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsIndexResponseEntity(
        title: json["title"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
      };
}
