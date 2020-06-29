part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitialState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoadingState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteErrorState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoadedState extends FavoriteState {
  final List<ArticleEntity> articles;

  FavoriteLoadedState(this.articles);

  @override
  List<Object> get props => [];
}
