import 'package:nyt_news/src/scenes/main/domain/entities/article_entity.dart';

class ArticleResponseModel {
  String _status;
  String _copyright;
  int _numResults;
  List<ArticleModel> _articles;

  ArticleResponseModel(
      {String status,
      String copyright,
      int numResults,
      List<ArticleModel> articles}) {
    this._status = status;
    this._copyright = copyright;
    this._numResults = numResults;
    this._articles = articles;
  }

  String get status => _status;
  set status(String status) => _status = status;
  String get copyright => _copyright;
  set copyright(String copyright) => _copyright = copyright;
  int get numResults => _numResults;
  set numResults(int numResults) => _numResults = numResults;
  List<ArticleModel> get articles => _articles;
  set results(List<ArticleModel> results) => _articles = results;

  ArticleResponseModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _copyright = json['copyright'];
    _numResults = json['num_results'];
    if (json['results'] != null) {
      _articles = new List<ArticleModel>();
      json['results'].forEach((v) {
        _articles.add(new ArticleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['copyright'] = this._copyright;
    data['num_results'] = this._numResults;
    if (this._articles != null) {
      data['results'] = this._articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleModel extends ArticleEntity {
  String _uri;
  String _url;
  int _id;
  int _assetId;
  String _source;
  String _publishedDate;
  String _updated;
  String _section;
  String _subsection;
  String _nytdsection;
  String _adxKeywords;
  Null _column;
  String _byline;
  String _type;
  String _title;
  String _articleAbstract;
  List<String> _desFacet;
  List<String> _orgFacet;
  List<String> _perFacet;
  List<String> _geoFacet;
  List<Media> _media;
  int _etaId;

  ArticleModel(
      {String uri,
      String url,
      int id,
      int assetId,
      String source,
      String publishedDate,
      String updated,
      String section,
      String subsection,
      String nytdsection,
      String adxKeywords,
      Null column,
      String byline,
      String type,
      String title,
      String abstract,
      List<String> desFacet,
      List<String> orgFacet,
      List<String> perFacet,
      List<String> geoFacet,
      List<Media> media,
      int etaId}) {
    this._uri = uri;
    this._url = url;
    this._id = id;
    this._assetId = assetId;
    this._source = source;
    this._publishedDate = publishedDate;
    this._updated = updated;
    this._section = section;
    this._subsection = subsection;
    this._nytdsection = nytdsection;
    this._adxKeywords = adxKeywords;
    this._column = column;
    this._byline = byline;
    this._type = type;
    this._title = title;
    this._articleAbstract = articleAbstract;
    this._desFacet = desFacet;
    this._orgFacet = orgFacet;
    this._perFacet = perFacet;
    this._geoFacet = geoFacet;
    this._media = media;
    this._etaId = etaId;
  }

  String get uri => _uri;
  set uri(String uri) => _uri = uri;
  String get url => _url;
  set url(String url) => _url = url;
  int get id => _id;
  set id(int id) => _id = id;
  int get assetId => _assetId;
  set assetId(int assetId) => _assetId = assetId;
  String get source => _source;
  set source(String source) => _source = source;
  String get publishedDate => _publishedDate;
  set publishedDate(String publishedDate) => _publishedDate = publishedDate;
  String get updated => _updated;
  set updated(String updated) => _updated = updated;
  String get section => _section;
  set section(String section) => _section = section;
  String get subsection => _subsection;
  set subsection(String subsection) => _subsection = subsection;
  String get nytdsection => _nytdsection;
  set nytdsection(String nytdsection) => _nytdsection = nytdsection;
  String get adxKeywords => _adxKeywords;
  set adxKeywords(String adxKeywords) => _adxKeywords = adxKeywords;
  Null get column => _column;
  set column(Null column) => _column = column;
  String get byline => _byline;
  set byline(String byline) => _byline = byline;
  String get type => _type;
  set type(String type) => _type = type;
  String get title => _title;
  set title(String title) => _title = title;
  String get articleAbstract => _articleAbstract;
  set articleAbstract(String articleAbstract) =>
      _articleAbstract = articleAbstract;
  List<String> get desFacet => _desFacet;
  set desFacet(List<String> desFacet) => _desFacet = desFacet;
  List<String> get orgFacet => _orgFacet;
  set orgFacet(List<String> orgFacet) => _orgFacet = orgFacet;
  List<String> get perFacet => _perFacet;
  set perFacet(List<String> perFacet) => _perFacet = perFacet;
  List<String> get geoFacet => _geoFacet;
  set geoFacet(List<String> geoFacet) => _geoFacet = geoFacet;
  List<Media> get media => _media;
  set media(List<Media> media) => _media = media;
  int get etaId => _etaId;
  set etaId(int etaId) => _etaId = etaId;

  ArticleModel.fromJson(Map<String, dynamic> json) {
    _uri = json['uri'];
    _url = json['url'];
    _id = json['id'];
    _assetId = json['asset_id'];
    _source = json['source'];
    _publishedDate = json['published_date'];
    _updated = json['updated'];
    _section = json['section'];
    _subsection = json['subsection'];
    _nytdsection = json['nytdsection'];
    _adxKeywords = json['adx_keywords'];
    _column = json['column'];
    _byline = json['byline'];
    _type = json['type'];
    _title = json['title'];
    _articleAbstract = json['abstract'];
    _desFacet = json['des_facet'].cast<String>();
    _orgFacet = json['org_facet'].cast<String>();
    _perFacet = json['per_facet'].cast<String>();
    _geoFacet = json['geo_facet'].cast<String>();
    if (json['media'] != null) {
      _media = new List<Media>();
      json['media'].forEach((v) {
        _media.add(new Media.fromJson(v));
      });
    }
    _etaId = json['eta_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this._uri;
    data['url'] = this._url;
    data['id'] = this._id;
    data['asset_id'] = this._assetId;
    data['source'] = this._source;
    data['published_date'] = this._publishedDate;
    data['updated'] = this._updated;
    data['section'] = this._section;
    data['subsection'] = this._subsection;
    data['nytdsection'] = this._nytdsection;
    data['adx_keywords'] = this._adxKeywords;
    data['column'] = this._column;
    data['byline'] = this._byline;
    data['type'] = this._type;
    data['title'] = this._title;
    data['abstract'] = this._articleAbstract;
    data['des_facet'] = this._desFacet;
    data['org_facet'] = this._orgFacet;
    data['per_facet'] = this._perFacet;
    data['geo_facet'] = this._geoFacet;
    if (this._media != null) {
      data['media'] = this._media.map((v) => v.toJson()).toList();
    }
    data['eta_id'] = this._etaId;
    return data;
  }

  ArticleEntity entity() {
    var _entityImageUrl = '';
    if (this._media != null && this.media.isNotEmpty) {
      _entityImageUrl = _media.first.mediaMetadata
          .firstWhere((element) => element.format == "mediumThreeByTwo210")
          .url;
    }
    return ArticleEntity(
        id: id,
        url: url,
        title: title,
        articleAbstract: articleAbstract,
        imageUrl: _entityImageUrl);
  }
}

class Media {
  String _type;
  String _subtype;
  String _caption;
  String _copyright;
  int _approvedForSyndication;
  List<MediaMetadata> _mediaMetadata;

  Media(
      {String type,
      String subtype,
      String caption,
      String copyright,
      int approvedForSyndication,
      List<MediaMetadata> mediaMetadata}) {
    this._type = type;
    this._subtype = subtype;
    this._caption = caption;
    this._copyright = copyright;
    this._approvedForSyndication = approvedForSyndication;
    this._mediaMetadata = mediaMetadata;
  }

  String get type => _type;
  set type(String type) => _type = type;
  String get subtype => _subtype;
  set subtype(String subtype) => _subtype = subtype;
  String get caption => _caption;
  set caption(String caption) => _caption = caption;
  String get copyright => _copyright;
  set copyright(String copyright) => _copyright = copyright;
  int get approvedForSyndication => _approvedForSyndication;
  set approvedForSyndication(int approvedForSyndication) =>
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
      _mediaMetadata = new List<MediaMetadata>();
      json['media-metadata'].forEach((v) {
        _mediaMetadata.add(new MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['subtype'] = this._subtype;
    data['caption'] = this._caption;
    data['copyright'] = this._copyright;
    data['approved_for_syndication'] = this._approvedForSyndication;
    if (this._mediaMetadata != null) {
      data['media-metadata'] =
          this._mediaMetadata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaMetadata {
  String _url;
  String _format;
  int _height;
  int _width;

  MediaMetadata({String url, String format, int height, int width}) {
    this._url = url;
    this._format = format;
    this._height = height;
    this._width = width;
  }

  String get url => _url;
  set url(String url) => _url = url;
  String get format => _format;
  set format(String format) => _format = format;
  int get height => _height;
  set height(int height) => _height = height;
  int get width => _width;
  set width(int width) => _width = width;

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _format = json['format'];
    _height = json['height'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['format'] = this._format;
    data['height'] = this._height;
    data['width'] = this._width;
    return data;
  }
}
