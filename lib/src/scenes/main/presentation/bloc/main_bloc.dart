import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/src/scenes/main/domain/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/main/domain/interactor/main_interactor.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainInteractor interactor;

  MainBloc(this.interactor);

  @override
  MainState get initialState => MainInitialState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is FetchNewsEvent) {
      yield MainLoadingState();
      final either = await interactor.fetchNews();
      if (either.isRight()) {
        final entities = either.getOrElse(null);
        if (entities.isEmpty) {
          yield MainInitialState();
        } else {
          yield MainLoadedState(entities);
        }
      } else {
        yield MainErrorState();
      }
    }
  }
}
