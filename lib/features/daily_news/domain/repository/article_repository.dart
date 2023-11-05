import 'package:flutter_awesome_starter/core/resources/data_state.dart';
import 'package:flutter_awesome_starter/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
