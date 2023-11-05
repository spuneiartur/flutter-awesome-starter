import 'package:flutter_awesome_starter/core/resources/data_state.dart';
import 'package:flutter_awesome_starter/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_awesome_starter/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_awesome_starter/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState =
        await _getArticleUseCase(null); // is the same with .call()

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(articles: dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticlesError(error: dataState.error!));
    }
  }
}
