import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/src/scenes/favorite/data/datasources/favorite_local_data_source.dart';
import 'package:nyt_news/src/scenes/favorite/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<Either<DBException, List<ArticleEntity>>> fetchFavoriteArticles() {
    return localDataSource.fetchFavoriteArticles();
  }
}
