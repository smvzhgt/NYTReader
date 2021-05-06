part of 'shared_bloc.dart';

abstract class SharedEvent extends Equatable {
  const SharedEvent();
}

class FetchSharedArticlesEvent extends SharedEvent {
  final bool isCachedData;

  FetchSharedArticlesEvent({required this.isCachedData});

  @override
  List<Object> get props => throw UnimplementedError();
}
