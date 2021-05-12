import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

abstract class ViewedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles();
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article);
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article);
}

class ViewedInteractorImpl implements ViewedInteractor {
  final ViewedRepository repository;

  ViewedInteractorImpl({
    required this.repository,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles() async {
    return repository.fetchMostViewedArticles();
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
