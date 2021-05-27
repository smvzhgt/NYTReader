import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';

abstract class EmailedRemoteDataSource {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles();
}

class EmailedRemoteDataSourceImpl implements EmailedRemoteDataSource {
  final ApiClient apiClient;

  EmailedRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles() {
    return apiClient.fetchMostEmailedArticles();
  }
}
