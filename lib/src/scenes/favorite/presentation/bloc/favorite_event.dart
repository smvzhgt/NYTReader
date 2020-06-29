part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FetchFavoriteArticlesEvent extends FavoriteEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
