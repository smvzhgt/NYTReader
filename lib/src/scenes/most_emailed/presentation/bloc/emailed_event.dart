part of 'emailed_bloc.dart';

abstract class EmailedEvent extends Equatable {
  const EmailedEvent();
}

class FetchNewsEvent extends EmailedEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class SetArticleFavoriteEvent extends EmailedEvent {
  final ArticleEntity articleEntity;

  SetArticleFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}