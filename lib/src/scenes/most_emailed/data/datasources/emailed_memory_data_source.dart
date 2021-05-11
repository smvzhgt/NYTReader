import 'package:nyt_news/core/entities/article_entity.dart';

abstract class EmailedMemoryDataSource {
  List<ArticleEntity> getArticlesFromMemoryCache();
  putArticlesToMemoryCache(List<ArticleEntity> articles);
  addArticleAsFavoriteToCache(ArticleEntity article);
  deleteArticleAsFavoriteFromCache(ArticleEntity article);
}

class EmailedMemoryDataSourceImpl implements EmailedMemoryDataSource {
  List<ArticleEntity> _articles = List<ArticleEntity>.empty(growable: true);

  @override
  List<ArticleEntity> getArticlesFromMemoryCache() {
    return _articles;
  }

  @override
  putArticlesToMemoryCache(List<ArticleEntity> articles) {
    _articles.clear();
    _articles = articles;
  }

  @override
  addArticleAsFavoriteToCache(ArticleEntity article) {
    _articles
        .firstWhere(
          (element) => element.id == article.id,
        )
        .isFavorite = true;
  }

  @override
  deleteArticleAsFavoriteFromCache(ArticleEntity article) {
    _articles
        .firstWhere(
          (element) => element.id == article.id,
        )
        .isFavorite = false;
  }
}
