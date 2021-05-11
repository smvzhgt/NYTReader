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
      final remoteResult = either.getOrElse(() => List<ArticleModel>.empty());
      final remoteEntities = remoteResult.map((e) => e.entity()).toList();

      final dbResult = await localDataSource.fetchArticlesFromDB();
      final dbEntities = dbResult.getOrElse(() => List<ArticleModel>.empty());

      dbEntities.forEach((dbElement) {
        remoteEntities
            .firstWhere(
              (element) => dbElement.id == element.id,
            )
            .isFavorite = true;
      });

      memoryDataSource.putArticlesToMemoryCache(remoteEntities);

      return Right(remoteEntities);
    } else {
      return Left(NetworkException());
    }
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) async {
    memoryDataSource.addArticleAsFavoriteToCache(article);
    return await localDataSource.saveArticleToDB(article);
  }

  @override
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article) async {
    memoryDataSource.deleteArticleAsFavoriteFromCache(article);
    return await localDataSource.deleteArticleFromDB(article);
  }
}
