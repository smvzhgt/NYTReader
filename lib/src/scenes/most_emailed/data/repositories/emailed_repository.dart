import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/result_type.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_local_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

class EmailedRepositoryImpl implements EmailedRepository {
  final EmailedRemoteDataSource remoteDataSource;
  final EmailedLocalDataSource localDataSource;

  EmailedRepositoryImpl({
    @required this.remoteDataSource,
    this.localDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles() async {
    final either = await remoteDataSource.fetchMostEmailedArticles();
    if (either.isRight()) {
      final listArticles = either.getOrElse(null);
      final entities = listArticles.map((e) => e.entity()).toList();
      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }

  @override
  Future<Either<DBException, EmptyResult>> saveArticleToDB(
      ArticleEntity article) {
    return localDataSource.saveArticleToDB(article);
  }
}
