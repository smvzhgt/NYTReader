part of 'emailed_bloc.dart';

abstract class EmailedEvent extends Equatable {
  const EmailedEvent();
}

class FetchNewsEvent extends EmailedEvent {
  final bool isCachedData;

  FetchNewsEvent({required this.isCachedData});

  @override
  List<Object> get props => throw UnimplementedError();
}

class AddToFavoriteEvent extends EmailedEvent {
  final ArticleEntity articleEntity;

  AddToFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}

class DeleteFromFavoriteEvent extends EmailedEvent {
  final ArticleEntity articleEntity;

  DeleteFromFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}
