import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:nyt_news/core/api_client/endpoint.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';
import 'package:nyt_news/core/wrappers/dotenv_wrapper.dart';

abstract class ApiClient {
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles();
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles();
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles();
}

class ApiClientImpl implements ApiClient {
  static Client _client = Client();
  final _days = 30;
  final _apiKey = DotenvWrapper.instance.getValue(DotenvWrapper.apiKey);

  static Future<Either<NetworkException, List<ArticleEntity>>> doRequest(
      Uri url) async {
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final responseModel =
          ArticleResponseModel.fromJson(json.decode(response.body));
      return Right(responseModel.articles);
    } else {
      return Left(NetworkException());
    }
  }

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostEmailedArticles() async {
    var url = Uri.https(
      Endpoint.BASE_URL,
      '/svc/mostpopular/v2/emailed/$_days.json',
      {
        "api-key": "$_apiKey",
      },
    );

    return compute(doRequest, url);
  }

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostSharedArticles() async {
    var url = Uri.https(
      Endpoint.BASE_URL,
      '/svc/mostpopular/v2/shared/$_days/facebook.json',
      {
        "api-key": "$_apiKey",
      },
    );

    return compute(doRequest, url);
  }

  @override
  Future<Either<NetworkException, List<ArticleEntity>>>
      fetchMostViewedArticles() async {
    final authority = Endpoint.BASE_URL;
    final unEncodedPath = '/svc/mostpopular/v2/viewed/$_days.json';
    final queryParams = {
      "api-key": "$_apiKey",
    };
    var url = Uri.https(
      authority,
      unEncodedPath,
      queryParams,
    );
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final responseModel =
          ArticleResponseModel.fromJson(json.decode(response.body));
      return Right(responseModel.articles);
    } else {
      return Left(NetworkException());
    }
  }
}
