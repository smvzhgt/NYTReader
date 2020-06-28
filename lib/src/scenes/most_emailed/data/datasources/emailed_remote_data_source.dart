import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/core/api_client/api_client.dart';

abstract class EmailedRemoteDataSource {
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostEmailedArticles();
}

class EmailedRemoteDataSourceImpl implements EmailedRemoteDataSource {
  final ApiClient apiClient;

  EmailedRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostEmailedArticles() {
    return apiClient.fetchMostEmailedArticles();
  }
}
