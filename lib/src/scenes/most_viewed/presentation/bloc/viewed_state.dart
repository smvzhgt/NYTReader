part of 'viewed_bloc.dart';

abstract class ViewedState extends Equatable {
  const ViewedState();
}

class ViewedInitialState extends ViewedState {
  @override
  List<Object> get props => [];
}

class ViewedLoadingState extends ViewedState {
  @override
  List<Object> get props => [];
}

class ViewedErrorState extends ViewedState {
  @override
  List<Object> get props => [];
}

class ViewedLoadedState extends ViewedState {
  final List<ArticleEntity> articles;

  ViewedLoadedState(this.articles);

  @override
  List<Object> get props => [];
}
