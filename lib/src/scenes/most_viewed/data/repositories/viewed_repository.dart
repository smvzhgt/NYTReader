import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/most_viewed/data/datasources/viewed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/repository/viewed_repository.dart';

class ViewedRepositoryImpl implements ViewedRepository {
  final ViewedRemoteDataSource remoteDataSource;

  ViewedRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostViewedArticles() {
    return remoteDataSource.fetchMostViewedArticles();
  }
}
