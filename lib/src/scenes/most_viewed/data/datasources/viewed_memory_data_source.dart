import 'package:nyt_news/core/entities/article_entity.dart';

abstract class ViewedMemoryDataSource {
  List<ArticleEntity> getArticlesFromMemoryCache();
  putArticlesToMemoryCache(List<ArticleEntity> articles);
}

class ViewedMemoryDataSourceImpl implements ViewedMemoryDataSource {
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
}
