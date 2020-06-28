part of 'shared_bloc.dart';

abstract class SharedEvent extends Equatable {
  const SharedEvent();
}

class FetchSharedArticlesEvent extends SharedEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
