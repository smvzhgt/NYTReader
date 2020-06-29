import 'package:dartz/dartz.dart';
import 'package:nyt_news/core/db/db_client.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/src/scenes/most_emailed/data/datasources/emailed_remote_data_source.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/repository/emailed_repository.dart';

class EmailedRepositoryImpl implements EmailedRepository {
  final EmailedRemoteDataSource emailedRemoteDataSource;

  EmailedRepositoryImpl(this.emailedRemoteDataSource);

  Future _saveToDb(List<ArticleEntity> entities) async {
    for (var i = 0; i < entities.length; i++) {
      final newArticle = entities[i];
      final dbArticle = await DBClient.db.getArticle(newArticle.id);
      if (dbArticle == null) {
        await DBClient.db.insertNewArticle(newArticle);
      } else {
        await DBClient.db.updateArticle(newArticle);
      }
    }
  }

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles() async {
    final either = await emailedRemoteDataSource.fetchMostEmailedArticles();
    if (either.isRight()) {
      final listArticles = either.getOrElse(null);
      final entities = listArticles.map((e) => e.entity()).toList();
      await _saveToDb(entities);
      return Right(entities);
    } else {
      return Left(NetworkException());
    }
  }
}
