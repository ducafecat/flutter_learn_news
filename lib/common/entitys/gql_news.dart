class GqlNewsResponseEntity {
  GqlNewsResponseEntity({
    this.id,
    this.title,
    this.category,
    this.author,
    this.url,
    this.addtime,
    this.thumbnail,
  });

  String id;
  String title;
  String category;
  String author;
  String url;
  DateTime addtime;
  Thumbnail thumbnail;

  factory GqlNewsResponseEntity.fromJson(Map<String, dynamic> json) =>
      GqlNewsResponseEntity(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        author: json["author"],
        url: json["url"],
        addtime: DateTime.parse(json["addtime"]),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "author": author,
        "url": url,
        "addtime":
            "${addtime.year.toString().padLeft(4, '0')}-${addtime.month.toString().padLeft(2, '0')}-${addtime.day.toString().padLeft(2, '0')}",
        "thumbnail": thumbnail.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    this.url,
  });

  String url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
