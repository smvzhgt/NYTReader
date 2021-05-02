import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

abstract class ViewedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles();
}

class ViewedInteractorImpl implements ViewedInteractor {
  final ViewedRepository repository;

  ViewedInteractorImpl({
    required this.repository,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles() async {
    final either = await repository.fetchMostViewedArticles();
    if (either.isRight()) {
      final articles = either.getOrElse(() => List<ArticleModel>.empty());
      final entities = articles.map((e) => e.entity()).toList();
      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }
}
