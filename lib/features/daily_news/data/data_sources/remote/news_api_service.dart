import 'package:dio/dio.dart';
import 'package:flutter_awesome_starter/core/constants/constants.dart';
import 'package:flutter_awesome_starter/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  }) {
    throw UnimplementedError();
  }
}
