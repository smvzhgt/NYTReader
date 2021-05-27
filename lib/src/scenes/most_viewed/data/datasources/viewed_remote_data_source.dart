import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';

abstract class ViewedRemoteDataSource {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles();
}

class ViewedRemoteDataSourceImpl implements ViewedRemoteDataSource {
  final ApiClient apiClient;

  ViewedRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles() {
    return apiClient.fetchMostViewedArticles();
  }
}
