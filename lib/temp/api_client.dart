import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' show Client;
import 'package:nyt_news/core/api_client/endpoint.dart';
import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/exceptions.dart';
import 'package:nyt_news/core/models/article_response_model.dart';

abstract class ApiClient {
  Future<Either<NetworkException, List<ArticleModel>>> fetchNews();
}

class ApiClientImpl implements ApiClient {
  Client _client = Client();
  final _days = 30;
  final _apiKey = Constants.API_KEY;

  @override
  Future<Either<NetworkException, List<ArticleModel>>> fetchNews() async {
    final authority = Endpoint.BASE_URL;
    final unencodedPath = '/svc/mostpopular/v2/emailed/$_days.json';
    final queryParams = {
      "api-key": "$_apiKey",
    };
    var url = Uri.https(
      authority,
      unencodedPath,
      queryParams,
    );
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final news = ArticleResponseModel.fromJson(json.decode(response.body));
      return Right(news.articles);
    } else {
      return Left(NetworkException());
    }
  }
}
