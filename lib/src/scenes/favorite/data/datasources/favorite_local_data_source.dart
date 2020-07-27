import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/db/db_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';

abstract class FavoriteLocalDataSource {
  Future<Either<DBException, List<ArticleEntity>>> fetchFavoriteArticles();
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final DBClient dbClient;

  FavoriteLocalDataSourceImpl({
    @required this.dbClient,
  });

  @override
  Future<Either<DBException, List<ArticleEntity>>>
      fetchFavoriteArticles() async {
    try {
      final result = await dbClient.getAllArticles();
      return Right(result);
    } on Exception {
      return Left(DBException());
    }
  }
}
