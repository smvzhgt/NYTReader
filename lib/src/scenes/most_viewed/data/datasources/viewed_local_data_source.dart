import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/db/db_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:sqflite/sqflite.dart';

abstract class ViewedLocalDataSource {
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article);
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article);
  Future<Either<DBException, List<ArticleEntity>>> fetchArticlesFromDB();
}

class ViewedLocalDataSourceImpl implements ViewedLocalDataSource {
  final DBClient dbClient;

  ViewedLocalDataSourceImpl({
    required this.dbClient,
  });

  Future<int?> _saveToDb(ArticleEntity article) async {
    final dbArticle = await dbClient.getArticle(article.id);
    if (dbArticle == null) {
      return await dbClient.insertArticle(article);
    } else {
      return await dbClient.updateArticle(article);
    }
  }

  Future<int?> _deleteFromDb(ArticleEntity article) async {
    return await dbClient.deleteArticle(article.id);
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) async {
    try {
      final result = await _saveToDb(article);
      if (result != null && !result.isNegative) {
        return Right(EmptyResult());
      } else {
        return Left(DBException());
      }
    } on DatabaseException {
      return Left(DBException());
    }
  }

  @override
  Future<Either<DBException, EmptyResult>> deleteArticleFromDB(
      ArticleEntity article) async {
    try {
      final result = await _deleteFromDb(article);
      if (result != null && !result.isNegative) {
        return Right(EmptyResult());
      } else {
        return Left(DBException());
      }
    } on DatabaseException {
      return Left(DBException());
    }
  }

  @override
  Future<Either<DBException, List<ArticleEntity>>> fetchArticlesFromDB() async {
    try {
      final result = await dbClient.getAllArticles();
      return Right(result);
    } on DatabaseException {
      return Left(DBException());
    }
  }
}
