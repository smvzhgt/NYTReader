import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

class ViewedRepositoryImpl implements ViewedRepository {
  final ViewedRemoteDataSource remoteDataSource;
  final ViewedLocalDataSource localDataSource;

  ViewedRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles() async {
    final either = await remoteDataSource.fetchMostViewedArticles();

    if (either.isRight()) {
      final remoteEntities = either.getOrElse(() => List<ArticleEntity>.empty());

      final dbResult = await localDataSource.fetchArticlesFromDB();
      final dbEntities = dbResult.getOrElse(() => List<ArticleEntity>.empty());

      dbEntities.forEach((dbElement) {
        remoteEntities.forEach((element) {
          if (element.id == dbElement.id) {
            element.isFavorite = true;
          }
        });
      });

      return Right(remoteEntities);
    } else {
      return Left(NetworkException());
    }
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) async {
    return await localDataSource.saveArticleToDB(article);
  }

  @override
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article) async {
    return await localDataSource.deleteArticleFromDB(article);
  }
}
