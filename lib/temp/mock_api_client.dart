import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/core/api_client/api_client.dart';

class MockApiClientImpl implements ApiClient {
  @override
  Future<Either<NetworkException, List<ArticleModel>>> fetchNews() async {
    return Future<Either<NetworkException, List<ArticleModel>>>.delayed(
      Duration(seconds: 1),
      () async {
        return DataSource().getArticleModels();
      },
    );
  }
}

class DataSource {
  Future<Either<NetworkException, List<ArticleModel>>>
      getArticleModels() async {
    List<ArticleModel> list = [
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle(),
      DataSource().makeArticle()
    ];
    return Right(list);
  }

  final _abstract =
      'The default growable list, as returned by new List() or [], keeps an internal buffer, and grows that buffer when necessary. This guarantees that a sequence of add operations will each execute in amortized constant time.';

  ArticleModel makeArticle() {
    MediaMetadata mediaMetadata = MediaMetadata(url: '');
    List<MediaMetadata> mediaMetadataList = [mediaMetadata];

    Media media = Media(mediaMetadata: mediaMetadataList);
    List<Media> mediaList = [media];

    ArticleModel model = ArticleModel(
        id: 1,
        url: 'wwww',
        title: 'ArticleModel title',
        abstract: _abstract,
        media: mediaList);

    return model;
  }
}
