import 'package:nyt_news/core/entities/article_entity.dart';

class ArticleResponseModel {
  String? _status;
  String? _copyright;
  int? _numResults;
  List<ArticleModel> _articles = List<ArticleModel>.empty(growable: true);

  ArticleResponseModel(
      {String? status,
      String? copyright,
      int? numResults,
      required List<ArticleModel> articles}) {
    this._status = status;
    this._copyright = copyright;
    this._numResults = numResults;
    this._articles = articles;
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  String? get copyright => _copyright;
  set copyright(String? copyright) => _copyright = copyright;
  int? get numResults => _numResults;
  set numResults(int? numResults) => _numResults = numResults;
  List<ArticleModel> get articles => _articles;
  set results(List<ArticleModel> results) => _articles = results;

  ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _copyright = json['copyright'];
    _numResults = json['num_results'];
    json['results'].forEach((v) {
      _articles.add(ArticleModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this._status;
    data['copyright'] = this._copyright;
    data['num_results'] = this._numResults;
    data['results'] = this._articles.map((v) => v.toJson()).toList();
    return data;
  }
}

class ArticleModel extends ArticleEntity {
  int _id = 0;
  String _url = "";
  String _title = "";
  String _articleAbstract = "";
  List<Media> _media = List<Media>.empty(growable: true);

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
            isFavorite: false) {
    this._id = id;
    this._url = url;
    this._title = title;
    this._articleAbstract = articleAbstract;
    this._media = media;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get url => _url;
  set url(String url) => _url = url;
  String get title => _title;
  set title(String title) => _title = title;
  String get articleAbstract => _articleAbstract;
  set articleAbstract(String articleAbstract) =>
      _articleAbstract = articleAbstract;
  List<Media> get media => _media;
  set media(List<Media> media) => _media = media;

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
        media: media);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this._url;
    data['id'] = this._id;
    data['title'] = this._title;
    data['abstract'] = this._articleAbstract;
    data['media'] = this._media.map((v) => v.toJson()).toList();
    return data;
  }

  ArticleEntity entity() {
    String entityImageUrl = "";
    if (this.media.isNotEmpty) {
      entityImageUrl = _media.first.mediaMetadata
          .firstWhere((element) => element.format == "mediumThreeByTwo210")
          .url!;
    }
    return ArticleEntity(
        id: id,
        url: url,
        title: title,
        articleAbstract: articleAbstract,
        imageUrl: entityImageUrl,
        isFavorite: false);
  }
}

class Media {
  String? _type;
  String? _subtype;
  String? _caption;
  String? _copyright;
  int? _approvedForSyndication;
  List<MediaMetadata> _mediaMetadata =
      List<MediaMetadata>.empty(growable: true);

  Media(
      {String? type,
      String? subtype,
      String? caption,
      String? copyright,
      int? approvedForSyndication,
      required List<MediaMetadata> mediaMetadata}) {
    this._type = type;
    this._subtype = subtype;
    this._caption = caption;
    this._copyright = copyright;
    this._approvedForSyndication = approvedForSyndication;
    this._mediaMetadata = mediaMetadata;
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get subtype => _subtype;
  set subtype(String? subtype) => _subtype = subtype;
  String? get caption => _caption;
  set caption(String? caption) => _caption = caption;
  String? get copyright => _copyright;
  set copyright(String? copyright) => _copyright = copyright;
  int? get approvedForSyndication => _approvedForSyndication;
  set approvedForSyndication(int? approvedForSyndication) =>
      _approvedForSyndication = approvedForSyndication;
  List<MediaMetadata> get mediaMetadata => _mediaMetadata;
  set mediaMetadata(List<MediaMetadata> mediaMetadata) =>
      _mediaMetadata = mediaMetadata;

  Media.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _subtype = json['subtype'];
    _caption = json['caption'];
    _copyright = json['copyright'];
    _approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      _mediaMetadata = List<MediaMetadata>.empty(growable: true);
      json['media-metadata'].forEach((v) {
        _mediaMetadata.add(MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this._type;
    data['subtype'] = this._subtype;
    data['caption'] = this._caption;
    data['copyright'] = this._copyright;
    data['approved_for_syndication'] = this._approvedForSyndication;
    if (this._mediaMetadata.isNotEmpty) {
      data['media-metadata'] =
          this._mediaMetadata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaMetadata {
  String? _url;
  String? _format;
  int? _height;
  int? _width;

  MediaMetadata({String? url, String? format, int? height, int? width}) {
    this._url = url;
    this._format = format;
    this._height = height;
    this._width = width;
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  String? get format => _format;
  set format(String? format) => _format = format;
  int? get height => _height;
  set height(int? height) => _height = height;
  int? get width => _width;
  set width(int? width) => _width = width;

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _format = json['format'];
    _height = json['height'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this._url;
    data['format'] = this._format;
    data['height'] = this._height;
    data['width'] = this._width;
    return data;
  }
}
