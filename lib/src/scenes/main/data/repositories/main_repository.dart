import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/main/data/datasources/main_remote_data_source.dart';
import 'package:nyt_news/src/scenes/main/domain/repository/main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRemoteDataSource mainRemoteDataSource;

  MainRepositoryImpl(this.mainRemoteDataSource);

  @override
  Future<Either<NetworkException, List<ArticleModel>>> fetchNews() {
    return mainRemoteDataSource.fetchNews();
  }
}
