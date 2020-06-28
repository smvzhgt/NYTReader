import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';

abstract class ViewedRepository {
  Future<Either<NetworkException, List<ArticleModel>>>
      fetchMostViewedArticles();
}
