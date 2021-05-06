import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

abstract class EmailedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles(bool isCachedData);
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article);
}

class EmailedInteractorImpl implements EmailedInteractor {
  final EmailedRepository repository;

  EmailedInteractorImpl({
    required this.repository,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles(bool isCachedData) async {
    return repository.fetchMostEmailedArticles(isCachedData);
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) {
    return repository.saveArticleToDB(article);
  }
}
