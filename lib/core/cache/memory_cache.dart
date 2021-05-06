import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';

// abstract class ApiClient {
//   Future<Either<NetworkException, List<ArticleModel>>> fetchMostEmailedArticles();
//   Future<Either<NetworkException, List<ArticleModel>>> fetchMostSharedArticles();
//   Future<Either<NetworkException, List<ArticleModel>>> fetchMostViewedArticles();
// }

// abstract class MemoryCache {
//   Future<Either<CacheException, List<ArticleModel>>> getArticlesFromMemoryCache();
//   void putArticlesToMemoryCache(List<ArticleModel> articles);
// }

// class LocalMemoryCache {
//   LocalMemoryCache._();
//
//   static final LocalMemoryCache cache = LocalMemoryCache._();
//
//   List<ArticleModel> _articles = List<ArticleModel>.empty(growable: true);
//
//   Future<List<ArticleModel>> getArticlesFromMemoryCache() async {
//     return _articles;
//   }
//
//   putArticlesToMemoryCache(List<ArticleModel> articles) async {
//     _articles.clear();
//     _articles = articles;
//   }
// }
