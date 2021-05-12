import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/db/db_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';

abstract class FavoriteLocalDataSource {
  Future<Either<DBException, List<ArticleEntity>>> fetchFavoriteArticles();
  Future<Either<DBException, List<ArticleEntity>>> deleteArticleFromDB(
      ArticleEntity article);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final DBClient dbClient;

  FavoriteLocalDataSourceImpl({
    required this.dbClient,
  });

  Future<int?> _deleteFromDb(ArticleEntity article) async {
    return await dbClient.deleteArticle(article.id);
  }

  @override
  Future<Either<DBException, List<ArticleEntity>>>
      fetchFavoriteArticles() async {
    try {
      final articles = await dbClient.getAllArticles();
      return Right(articles);
    } on Exception {
      return Left(DBException());
    }
  }

  @override
  Future<Either<DBException, List<ArticleEntity>>> deleteArticleFromDB(
      ArticleEntity article) async {
    final result = await _deleteFromDb(article);
    if (result != null && !result.isNegative) {
      final articles = await dbClient.getAllArticles();
      return Right(articles);
    } else {
      return Left(DBException());
    }
  }
}
