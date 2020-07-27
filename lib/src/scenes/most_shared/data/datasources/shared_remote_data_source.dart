import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';

abstract class SharedRemoteDataSource {
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostSharedArticles();
}

class SharedRemoteDataSourceImpl implements SharedRemoteDataSource {
  final ApiClient apiClient;

  SharedRemoteDataSourceImpl({
    @required this.apiClient,
  });

  @override
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostSharedArticles() {
    return apiClient.fetchMostSharedArticles();
  }
}
