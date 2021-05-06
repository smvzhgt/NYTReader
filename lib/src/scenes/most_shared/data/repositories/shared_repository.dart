import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/most_shared/data/datasources/shared_memory_data_source.dart';
import 'package:nyt_news/src/scenes/most_shared/data/datasources/shared_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/repository/shared_repository.dart';

class SharedRepositoryImpl implements SharedRepository {
  final SharedRemoteDataSource remoteDataSource;
  final SharedMemoryDataSource memoryDataSource;

  SharedRepositoryImpl({
    required this.remoteDataSource,
    required this.memoryDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>> fetchMostSharedArticles(
      bool isCachedData) async {
    final cachedArticles = memoryDataSource.getArticlesFromMemoryCache();
    if (cachedArticles.isNotEmpty && isCachedData) {
      return Right(cachedArticles);
    }

    final either = await remoteDataSource.fetchMostSharedArticles();

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
