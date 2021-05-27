import 'package:nyt_news/core/entities/article_entity.dart';

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['num_results'] = this.numResults;
    data['results'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}

class ArticleModel extends ArticleEntity {
  final int id = 0;
  final String url = "";
  final String title = "";
  final String articleAbstract = "";
  final List<Media> media = List<Media>.empty(growable: true);

  ArticleModel({
    required int id,
    required String url,
    required String title,
    required String articleAbstract,
    required List<Media> media,
  }) : super(
          id: id,
          url: url,
          title: title,
          articleAbstract: articleAbstract,
          imageUrl: "",
          isFavorite: false,
        );

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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata> mediaMetadata = List<MediaMetadata>.empty(growable: true);

  Media(
      {String? type,
      String? subtype,
      String? caption,
      String? copyright,
      int? approvedForSyndication,
      required List<MediaMetadata> mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      mediaMetadata = List<MediaMetadata>.empty(growable: true);
      json['media-metadata'].forEach((v) {
        mediaMetadata.add(MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['subtype'] = this.subtype;
    data['caption'] = this.caption;
    data['copyright'] = this.copyright;
    data['approved_for_syndication'] = this.approvedForSyndication;
    if (this.mediaMetadata.isNotEmpty) {
      data['media-metadata'] =
          this.mediaMetadata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({String? url, String? format, int? height, int? width}) {
    this.url = url;
    this.format = format;
    this.height = height;
    this.width = width;
  }

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    data['format'] = this.format;
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}
