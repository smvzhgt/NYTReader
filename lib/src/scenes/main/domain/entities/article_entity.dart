class ArticleEntity {
  int _id;
  String _url;
  String _title;
  String _articleAbstract;
  String _imageUrl;

  ArticleEntity(
      {int id,
      String url,
      String title,
      String articleAbstract,
      String imageUrl}) {
    this._id = id;
    this._url = url;
    this._title = title;
    this._articleAbstract = articleAbstract;
    this._imageUrl = imageUrl;
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

  String get imageUrl => _imageUrl;
  set imageUrl(String _imageUrl) => _imageUrl = imageUrl;
}
