import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/entities/article_entity.dart';
import 'package:nyt_news/src/scenes/most_emailed/domain/interactor/emailed_interactor.dart';

part 'emailed_event.dart';
part 'emailed_state.dart';

class EmailedBloc extends Bloc<EmailedEvent, EmailedState> {
  final EmailedInteractor interactor;

  EmailedBloc(this.interactor);

  @override
  EmailedState get initialState => EmailedInitialState();

  @override
  Stream<EmailedState> mapEventToState(
    EmailedEvent event,
  ) async* {
    if (event is FetchNewsEvent) {
      yield EmailedLoadingState();
      final either = await interactor.fetchNews();
      if (either.isRight()) {
        final entities = either.getOrElse(null);
        if (entities.isEmpty) {
          yield EmailedInitialState();
        } else {
          yield EmailedLoadedState(entities);
        }
      } else {
        yield EmailedErrorState();
      }
    }
  }
}
