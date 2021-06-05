import 'package:nyt_news/core/entities/article_entity.dart';

import 'article_model.dart';

class ArticleResponseModel {
  String? status;
  String? copyright;
  int? numResults;
  List<ArticleEntity> articles = List<ArticleEntity>.empty(growable: true);

  ArticleResponseModel({
    String? status,
    String? copyright,
    int? numResults,
    required List<ArticleEntity> articles,
  });

  ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    json['results'].forEach((v) {
      ArticleModel articleModel = ArticleModel.fromJson(v);
      articles.add(articleModel.entity());
    });
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['num_results'] = this.numResults;
    data['results'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}
