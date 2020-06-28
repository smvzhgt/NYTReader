import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/repository/shared_repository.dart';

abstract class SharedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles();
}

class SharedInteractorImpl implements SharedInteractor {
  final SharedRepository repository;

  SharedInteractorImpl(this.repository);

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles() async {
    final either = await repository.fetchMostSharedArticles();
    if (either.isRight()) {
      final articles = either.getOrElse(null);
      final entities = articles.map((e) => e.entity()).toList();
      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }
}
