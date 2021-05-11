import 'dart:convert';

class ArticleEntity {
  int _id = 0;
  String _url = "";
  String _title = "";
  String _articleAbstract = "";
  String _imageUrl = "";
  bool _isFavorite = false;

  ArticleEntity(
      {required int id,
      required String url,
      required String title,
      required String articleAbstract,
      required String imageUrl,
      required bool isFavorite}) {
    this._id = id;
    this._url = url;
    this._title = title;
    this._articleAbstract = articleAbstract;
    this._imageUrl = imageUrl;
    this._isFavorite = isFavorite;
  }

  factory ArticleEntity.fromRawJson(String str) =>
      ArticleEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => ArticleEntity(
        url: json["url"],
        id: json["id"],
        title: json["title"],
        articleAbstract: json["article_abstract"],
        imageUrl: json["image_url"],
        isFavorite: false
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "title": title,
        "article_abstract": articleAbstract,
        "image_url": imageUrl,
        "isFavorite": isFavorite
      };

  int get id => _id;
  set id(int id) => _id = id;

  String get url => _url;
  set url(String url) => _url = url;

  String get title => _title;
  set title(String title) => _title = title;

  String get articleAbstract => _articleAbstract;

  set articleAbstract(String articleAbstract) =>
      _articleAbstract = articleAbstract;

  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  bool get isFavorite => _isFavorite;
  set isFavorite(bool isFavorite) => _isFavorite = isFavorite;
}
