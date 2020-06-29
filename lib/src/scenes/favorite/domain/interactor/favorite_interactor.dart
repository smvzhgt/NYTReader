import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/favorite/domain/repository/favorite_repository.dart';

abstract class FavoriteInteractor {
  Future<Either<DBException, List<ArticleEntity>>> fetchFavoriteArticles();
}

class FavoriteInteractorImpl implements FavoriteInteractor {
  final FavoriteRepository repository;

  FavoriteInteractorImpl(this.repository);

  @override
  Future<Either<DBException, List<ArticleEntity>>>
      fetchFavoriteArticles() async {
    return repository.fetchFavoriteArticles();
  }
}
