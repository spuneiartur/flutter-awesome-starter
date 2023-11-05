import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_awesome_starter/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone({required List<ArticleEntity> articles})
      : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError({required DioException error})
      : super(error: error);
}
