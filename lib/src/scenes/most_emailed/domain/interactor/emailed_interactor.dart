import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

abstract class EmailedInteractor {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles();
}

class EmailedInteractorImpl implements EmailedInteractor {
  final EmailedRepository repository;

  EmailedInteractorImpl(this.repository);

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles() async {
    return repository.fetchMostEmailedArticles();
  }
}
