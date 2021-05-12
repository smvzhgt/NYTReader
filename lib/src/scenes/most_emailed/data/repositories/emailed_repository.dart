import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

class EmailedRepositoryImpl implements EmailedRepository {
  final EmailedRemoteDataSource remoteDataSource;
  final EmailedLocalDataSource localDataSource;

  EmailedRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles() async {
    final either = await remoteDataSource.fetchMostEmailedArticles();

    if (either.isRight()) {
      final remoteResult = either.getOrElse(() => List<ArticleModel>.empty());
      final remoteEntities = remoteResult.map((e) => e.entity()).toList();

      final dbResult = await localDataSource.fetchArticlesFromDB();
      final dbEntities = dbResult.getOrElse(() => List<ArticleModel>.empty());

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
