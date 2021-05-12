part of 'viewed_bloc.dart';

abstract class ViewedEvent extends Equatable {
  const ViewedEvent();
}

class FetchViewedArticlesEvent extends ViewedEvent {
  final bool isCachedData;

  FetchViewedArticlesEvent({required this.isCachedData});

  @override
  List<Object> get props => throw UnimplementedError();
}

class AddToFavoriteEvent extends ViewedEvent {
  final ArticleEntity articleEntity;

  AddToFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}

class DeleteFromFavoriteEvent extends ViewedEvent {
  final ArticleEntity articleEntity;

  DeleteFromFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}