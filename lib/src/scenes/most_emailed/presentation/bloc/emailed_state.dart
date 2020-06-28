part of 'emailed_bloc.dart';

abstract class EmailedState extends Equatable {
  const EmailedState();
}

class EmailedInitialState extends EmailedState {
  @override
  List<Object> get props => [];
}

class EmailedLoadingState extends EmailedState {
  @override
  List<Object> get props => [];
}

class EmailedErrorState extends EmailedState {
  @override
  List<Object> get props => [];
}

class EmailedLoadedState extends EmailedState {
  final List<ArticleEntity> news;

  EmailedLoadedState(this.news);

  @override
  List<Object> get props => [];
}
