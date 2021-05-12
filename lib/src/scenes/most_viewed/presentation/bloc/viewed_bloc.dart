import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_viewed/domain/interactor/viewed_interactor.dart';

part 'viewed_event.dart';
part 'viewed_state.dart';

class ViewedBloc extends Bloc<ViewedEvent, ViewedState> {
  final ViewedInteractor interactor;

  ViewedBloc(
    ViewedState initialState,
    this.interactor,
  ) : super(initialState);

  @override
  Stream<ViewedState> mapEventToState(
    ViewedEvent event,
  ) async* {
    if (event is FetchViewedArticlesEvent) {
      yield ViewedLoadingState();
      final either = await interactor.fetchMostViewedArticles();
      if (either.isRight()) {
        final entities = either.getOrElse(() => List<ArticleEntity>.empty());
        if (entities.isEmpty) {
          yield ViewedInitialState();
        } else {
          yield ViewedLoadedState(entities);
        }
      } else {
        yield ViewedErrorState();
      }
    } else if (event is AddToFavoriteEvent) {
      final either = await interactor.saveArticleToDB(event.articleEntity);
      if (either.isLeft()) {
        yield ViewedDataBaseErrorState();
      }
    } else if (event is DeleteFromFavoriteEvent) {
      final either = await interactor.deleteArticleFromDB(event.articleEntity);
      if (either.isLeft()) {
        yield ViewedDataBaseErrorState();
      }
    }
  }
}
