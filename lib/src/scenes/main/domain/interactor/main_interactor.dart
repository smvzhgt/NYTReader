import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/src/scenes/main/domain/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/main/domain/repository/main_repository.dart';

abstract class MainInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>> fetchNews();
}

class MainInteractorImpl implements MainInteractor {
  final MainRepository repository;

  MainInteractorImpl(this.repository);

  @override
  Future<Either<NetworkException, List<ArticleEntity>>> fetchNews() async {
    final either = await repository.fetchNews();
    if (either.isRight()) {
      final articles = either.getOrElse(null);
      final entities = articles.map((e) => e.entity()).toList();
      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }
}
