import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/api_client/api_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';

abstract class SharedRemoteDataSource {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles();
}

class SharedRemoteDataSourceImpl implements SharedRemoteDataSource {
  final ApiClient apiClient;

  SharedRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles() {
    return apiClient.fetchMostSharedArticles();
  }
}
