import 'package:flutter_awesome_starter/core/resources/data_state.dart';
import 'package:flutter_awesome_starter/features/daily_news/data/models/article.dart';
import 'package:flutter_awesome_starter/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    throw UnimplementedError();
  }
}
