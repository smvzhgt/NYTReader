import 'package:nyt_news/core/entities/article_entity.dart';

import 'media.dart';

class ArticleModel {
  int id = 0;
  String url = "";
  String title = "";
  String articleAbstract = "";
  List<Media> media = List<Media>.empty(growable: true);

  ArticleModel({
    required int id,
    required String url,
    required String title,
    required String articleAbstract,
    required List<Media> media,
  })  : this.id = id,
        this.url = url,
        this.title = title,
        this.articleAbstract = articleAbstract,
        this.media = media;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    List<Media> media = List<Media>.empty(growable: true);
    int id = json['id'];
    String url = json['url'];
    String title = json['title'];
    String articleAbstract = json['abstract'];
    json['media'].forEach((v) {
      media.add(Media.fromJson(v));
    });
    return ArticleModel(
      id: id,
      url: url,
      title: title,
      articleAbstract: articleAbstract,
      media: media,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    data['title'] = this.title;
    data['abstract'] = this.articleAbstract;
    data['media'] = this.media.map((v) => v.toJson()).toList();
    return data;
  }

  ArticleEntity entity() {
    String entityImageUrl = "";
    if (this.media.isNotEmpty) {
      entityImageUrl = media.first.mediaMetadata
          .firstWhere((element) => element.format == "mediumThreeByTwo210")
          .url!;
    }
    return ArticleEntity(
      id: id,
      url: url,
      title: title,
      articleAbstract: articleAbstract,
      imageUrl: entityImageUrl,
      isFavorite: false,
    );
  }
}
