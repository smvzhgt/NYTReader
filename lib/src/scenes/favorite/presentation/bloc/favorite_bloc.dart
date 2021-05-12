import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/favorite/domain/interactor/favorite_interactor.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteInteractor interactor;

  FavoriteBloc(
    FavoriteState initialState,
    this.interactor,
  ) : super(initialState);

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FetchFavoriteArticlesEvent) {
      yield FavoriteLoadingState();
      final either = await interactor.fetchFavoriteArticles();
      if (either.isRight()) {
        final articles = either.getOrElse(() => List<ArticleEntity>.empty());
        if (articles.isEmpty) {
          yield FavoriteEmptyState();
        } else {
          yield FavoriteLoadedState(articles);
        }
      } else {
        yield FavoriteErrorState();
      }
    }
  }
}
