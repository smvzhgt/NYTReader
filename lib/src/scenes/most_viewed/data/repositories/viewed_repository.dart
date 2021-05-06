import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_memory_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

class ViewedRepositoryImpl implements ViewedRepository {
  final ViewedRemoteDataSource remoteDataSource;
  final ViewedMemoryDataSource memoryDataSource;

  ViewedRepositoryImpl({
    required this.remoteDataSource,
    required this.memoryDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>> fetchMostViewedArticles(
      bool isCachedData) async {
    final cachedArticles = memoryDataSource.getArticlesFromMemoryCache();
    if (cachedArticles.isNotEmpty && isCachedData) {
      return Right(cachedArticles);
    }

    final either = await remoteDataSource.fetchMostViewedArticles();

    if (either.isRight()) {
      final articles = either.getOrElse(() => List<ArticleModel>.empty());
      final entities = articles.map((e) => e.entity()).toList();

      memoryDataSource.putArticlesToMemoryCache(entities);

      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }
}
