import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_awesome_starter/core/constants/constants.dart';
import 'package:flutter_awesome_starter/core/resources/data_state.dart';
import 'package:flutter_awesome_starter/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_awesome_starter/features/daily_news/data/models/article.dart';
import 'package:flutter_awesome_starter/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIkey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            // type: DioExceptionType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
