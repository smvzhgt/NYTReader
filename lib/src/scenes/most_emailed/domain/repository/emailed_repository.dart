import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';

abstract class EmailedRepository {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles(bool isCachedData);

  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article);
}
