import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

abstract class ViewedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>> fetchMostViewedArticles(
      bool isCachedData);
}

class ViewedInteractorImpl implements ViewedInteractor {
  final ViewedRepository repository;

  ViewedInteractorImpl({
    required this.repository,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>> fetchMostViewedArticles(
      bool isCachedData) async {
    return repository.fetchMostViewedArticles(isCachedData);
  }
}
