// 首页
class GqlIndexResponseEntity {
  GqlIndexResponseEntity({
    this.dictCategories,
    this.dictChannels,
    this.busNews,
  });

  List<DictCategoryEntity> dictCategories;
  List<DictChannelEntity> dictChannels;
  List<GqlNewsResponseEntity> busNews;

  factory GqlIndexResponseEntity.fromJson(Map<String, dynamic> json) =>
      GqlIndexResponseEntity(
        dictCategories: List<DictCategoryEntity>.from(
            json["dictCategories"].map((x) => DictCategoryEntity.fromJson(x))),
        dictChannels: List<DictChannelEntity>.from(
            json["dictChannels"].map((x) => DictChannelEntity.fromJson(x))),
        busNews: List<GqlNewsResponseEntity>.from(
            json["busNews"].map((x) => GqlNewsResponseEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dictCategories":
            List<dynamic>.from(dictCategories.map((x) => x.toJson())),
        "dictChannels": List<dynamic>.from(dictChannels.map((x) => x.toJson())),
        "busNews": List<dynamic>.from(busNews.map((x) => x.toJson())),
      };
}

// 新闻
class GqlNewsResponseEntity {
  GqlNewsResponseEntity({
    this.title,
    this.dictChannel,
    this.dictCategories,
    this.author,
    this.url,
    this.addtime,
    this.thumbnail,
  });

  String title;
  DictChannelEntity dictChannel;
  List<DictCategoryEntity> dictCategories;
  String author;
  String url;
  DateTime addtime;
  ThumbnailEntity thumbnail;

  factory GqlNewsResponseEntity.fromJson(Map<String, dynamic> json) =>
      GqlNewsResponseEntity(
        title: json["title"],
        dictChannel: DictChannelEntity.fromJson(json["dict_channel"]),
        dictCategories: List<DictCategoryEntity>.from(
            json["dict_categories"].map((x) => DictCategoryEntity.fromJson(x))),
        author: json["author"],
        url: json["url"],
        addtime: DateTime.parse(json["addtime"]),
        thumbnail: ThumbnailEntity.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "dict_channel": dictChannel.toJson(),
        "dict_categories":
            List<dynamic>.from(dictCategories.map((x) => x.toJson())),
        "author": author,
        "url": url,
        "addtime":
            "${addtime.year.toString().padLeft(4, '0')}-${addtime.month.toString().padLeft(2, '0')}-${addtime.day.toString().padLeft(2, '0')}",
        "ThumbnailEntity": thumbnail.toJson(),
      };
}

// 分类
class DictCategoryEntity {
  DictCategoryEntity({
    this.code,
    this.title,
  });

  String code;
  String title;

  factory DictCategoryEntity.fromJson(Map<String, dynamic> json) =>
      DictCategoryEntity(
        code: json["code"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
      };
}

// 频道
class DictChannelEntity {
  DictChannelEntity({
    this.code,
    this.title,
    this.icon,
  });

  String code;
  String title;
  ThumbnailEntity icon;

  factory DictChannelEntity.fromJson(Map<String, dynamic> json) =>
      DictChannelEntity(
        code: json["code"],
        title: json["title"],
        icon: ThumbnailEntity.fromJson(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "icon": icon.toJson(),
      };
}

// 图
class ThumbnailEntity {
  ThumbnailEntity({
    this.url,
  });

  String url;

  factory ThumbnailEntity.fromJson(Map<String, dynamic> json) =>
      ThumbnailEntity(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
