import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/favorite/domain/interactor/favorite_interactor.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteInteractor interactor;

  FavoriteBloc({@required this.interactor});

  @override
  FavoriteState get initialState => FavoriteInitialState();

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FetchFavoriteArticlesEvent) {
      yield FavoriteLoadingState();
      final either = await interactor.fetchFavoriteArticles();
      if (either.isRight()) {
        final articles = either.getOrElse(null);
        if (articles.isEmpty) {
          yield FavoriteInitialState();
        } else {
          yield FavoriteLoadedState(articles);
        }
      } else {
        yield FavoriteErrorState();
      }
    }
  }
}
