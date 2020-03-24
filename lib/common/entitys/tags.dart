/// 标签列表 Request
class TagRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;
  String newsID;

  TagRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
    this.newsID,
  });
}

/// 标签列表 Response
class TagResponseEntity {
  String tag;

  TagResponseEntity({
    this.tag,
  });

  factory TagResponseEntity.fromJson(Map<String, dynamic> json) =>
      TagResponseEntity(
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
      };
}
