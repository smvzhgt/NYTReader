import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_shared/domain/interactor/shared_interactor.dart';

part 'shared_event.dart';
part 'shared_state.dart';

class SharedBloc extends Bloc<SharedEvent, SharedState> {
  final SharedInteractor interactor;

  SharedBloc(
    SharedState initialState,
    this.interactor,
  ) : super(initialState);

  @override
  Stream<SharedState> mapEventToState(
    SharedEvent event,
  ) async* {
    if (event is FetchSharedArticlesEvent) {
      yield SharedLoadingState();
      final either = await interactor.fetchMostSharedArticles();
      if (either.isRight()) {
        final entities = either.getOrElse(() => List<ArticleEntity>.empty());
        if (entities.isEmpty) {
          yield SharedInitialState();
        } else {
          yield SharedLoadedState(entities);
        }
      } else {
        yield SharedErrorState();
      }
    } else if (event is AddToFavoriteEvent) {
      interactor.saveArticleToDB(event.articleEntity);
    } else if (event is DeleteFromFavoriteEvent) {
      interactor.deleteArticleFromDB(event.articleEntity);
    }
  }
}
