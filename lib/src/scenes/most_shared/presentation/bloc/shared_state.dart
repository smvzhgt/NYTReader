part of 'shared_bloc.dart';

abstract class SharedState extends Equatable {
  const SharedState();
}

class SharedInitialState extends SharedState {
  @override
  List<Object> get props => [];
}

class SharedLoadingState extends SharedState {
  @override
  List<Object> get props => [];
}

class SharedErrorState extends SharedState {
  @override
  List<Object> get props => [];
}

class SharedLoadedState extends SharedState {
  final List<ArticleEntity> news;

  SharedLoadedState(this.news);

  @override
  List<Object> get props => [];
}
