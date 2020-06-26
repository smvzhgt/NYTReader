part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class FetchNewsEvent extends MainEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
