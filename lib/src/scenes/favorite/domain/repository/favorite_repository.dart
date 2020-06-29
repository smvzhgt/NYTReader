import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';

abstract class FavoriteRepository {
  Future<Either<DBException, List<ArticleEntity>>> fetchFavoriteArticles();
}
