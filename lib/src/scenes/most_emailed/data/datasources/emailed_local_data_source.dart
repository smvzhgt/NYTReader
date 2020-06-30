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

  Future _saveToDb(ArticleEntity article) async {
    final dbArticle = await DBClient.db.getArticle(article.id);
    if (dbArticle == null) {
      await DBClient.db.insertNewArticle(article);
    } else {
      await DBClient.db.updateArticle(article);
    }
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) async {
    try {
      // await DBClient.db.insertNewArticle(article);
      await _saveToDb(article);
      return Right(EmptyResult());
    } on Exception {
      return Left(DBException());
    }
  }
}
