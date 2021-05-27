import 'dart:convert';

import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id = 0;
  final String url = "";
  final String title = "";
  final String articleAbstract = "";
  final String imageUrl = "";
  bool isFavorite = false;

  ArticleEntity({
    required int id,
    required String url,
    required String title,
    required String articleAbstract,
    required String imageUrl,
    required bool isFavorite,
  });

  factory ArticleEntity.fromRawJson(String str) =>
      ArticleEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleEntity.fromJson(Map<String, dynamic> json) => ArticleEntity(
        url: json["url"],
        id: json["id"],
        title: json["title"],
        articleAbstract: json["article_abstract"],
        imageUrl: json["image_url"],
        isFavorite: json["is_favorite"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "title": title,
        "article_abstract": articleAbstract,
        "image_url": imageUrl,
        "isFavorite": isFavorite ? 1 : 0
      };

  @override
  List<Object?> get props =>
      [id, url, title, articleAbstract, imageUrl, isFavorite];
}
