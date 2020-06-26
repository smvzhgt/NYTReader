part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitialState extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoadingState extends MainState {
  @override
  List<Object> get props => [];
}

class MainErrorState extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoadedState extends MainState {
  final List<ArticleEntity> news;

  MainLoadedState(this.news);

  @override
  List<Object> get props => [];
}
