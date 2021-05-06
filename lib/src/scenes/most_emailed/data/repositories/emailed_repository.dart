import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_memory_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

class EmailedRepositoryImpl implements EmailedRepository {
  final EmailedRemoteDataSource remoteDataSource;
  final EmailedLocalDataSource localDataSource;
  final EmailedMemoryDataSource memoryDataSource;

  EmailedRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.memoryDataSource});

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles(bool isCachedData) async {
    final cachedArticles = memoryDataSource.getArticlesFromMemoryCache();
    if (cachedArticles.isNotEmpty && isCachedData) {
      return Right(cachedArticles);
    }

    final either = await remoteDataSource.fetchMostEmailedArticles();

    if (either.isRight()) {
      final articles = either.getOrElse(() => List<ArticleModel>.empty());
      final entities = articles.map((e) => e.entity()).toList();

      memoryDataSource.putArticlesToMemoryCache(entities);

      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) {
    return localDataSource.saveArticleToDB(article);
  }
}
