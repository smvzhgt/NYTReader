import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';

abstract class ViewedRemoteDataSource {
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostViewedArticles();
}

class ViewedRemoteDataSourceImpl implements ViewedRemoteDataSource {
  final ApiClient apiClient;

  ViewedRemoteDataSourceImpl({
    @required this.apiClient,
  });

  @override
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostViewedArticles() {
    return apiClient.fetchMostViewedArticles();
  }
}
