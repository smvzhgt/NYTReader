import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

abstract class ViewedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles();
}

class ViewedInteractorImpl implements ViewedInteractor {
  final ViewedRepository repository;

  ViewedInteractorImpl(this.repository);

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles() async {
    final either = await repository.fetchMostViewedArticles();
    if (either.isRight()) {
      final articles = either.getOrElse(null);
      final entities = articles.map((e) => e.entity()).toList();
      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }
}
