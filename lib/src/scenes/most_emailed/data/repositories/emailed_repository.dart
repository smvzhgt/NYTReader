import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

class EmailedRepositoryImpl implements EmailedRepository {
  final EmailedRemoteDataSource emailedRemoteDataSource;

  EmailedRepositoryImpl(this.emailedRemoteDataSource);

  @override
  Future<Either<NetworkException, List<ArticleModel>>> fetchMostEmailedArticles() {
    return emailedRemoteDataSource.fetchMostEmailedArticles();
  }
}
