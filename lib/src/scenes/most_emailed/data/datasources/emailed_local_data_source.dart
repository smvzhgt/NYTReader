import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/db/db_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';

abstract class EmailedLocalDataSource {
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article);
}

class EmailedLocalDataSourceImpl implements EmailedLocalDataSource {
  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) async {
    try {
      await DBClient.db.insertNewArticle(article);
      return Right(EmptyResult());
    } on Exception {
      return Left(DBException());
    }
  }
}
