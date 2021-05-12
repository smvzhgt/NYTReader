import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/repository/shared_repository.dart';

abstract class SharedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles();
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article);
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article);
}

class SharedInteractorImpl implements SharedInteractor {
  final SharedRepository repository;

  SharedInteractorImpl({
    required this.repository,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles() async {
    return repository.fetchMostSharedArticles();
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) async {
    return await repository.saveArticleToDB(article);
  }

  @override
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article) async {
    return await repository.deleteArticleFromDB(article);
  }
}
