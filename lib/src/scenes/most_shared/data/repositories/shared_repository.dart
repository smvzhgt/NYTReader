import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/most_shared/data/datasources/shared_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/repository/shared_repository.dart';

class SharedRepositoryImpl implements SharedRepository {
  final SharedRemoteDataSource remoteDataSource;

  SharedRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostSharedArticles() {
    return remoteDataSource.fetchMostSharedArticles();
  }
}
