import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/interactor/emailed_interactor.dart';

part 'emailed_event.dart';
part 'emailed_state.dart';

class EmailedBloc extends Bloc<EmailedEvent, EmailedState> {
  final EmailedInteractor interactor;

  EmailedBloc(
    EmailedState initialState,
    this.interactor,
  ) : super(initialState);

  @override
  Stream<EmailedState> mapEventToState(
    EmailedEvent event,
  ) async* {
    if (event is FetchNewsEvent) {
      yield EmailedLoadingState();
      final either = await interactor.fetchMostEmailedArticles();
      if (either.isRight()) {
        final entities = either.getOrElse(() => List<ArticleEntity>.empty());
        if (entities.isEmpty) {
          yield EmailedInitialState();
        } else {
          yield EmailedLoadedState(entities);
        }
      } else {
        yield EmailedErrorState();
      }
    } else if (event is AddToFavoriteEvent) {
      final either = await interactor.saveArticleToDB(event.articleEntity);
      if (either.isLeft()) {
        yield EmailedDataBaseErrorState();
      }
    } else if (event is DeleteFromFavoriteEvent) {
      final either = await interactor.deleteArticleFromDB(event.articleEntity);
      if (either.isLeft()) {
        yield EmailedDataBaseErrorState();
      }
    }
  }
}
