part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FetchFavoriteArticlesEvent extends FavoriteEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AddToFavoriteEvent extends FavoriteEvent {
  final ArticleEntity articleEntity;

  AddToFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}

class DeleteFromFavoriteEvent extends FavoriteEvent {
  final ArticleEntity articleEntity;

  DeleteFromFavoriteEvent(this.articleEntity);
  @override
  List<Object> get props => throw UnimplementedError();
}