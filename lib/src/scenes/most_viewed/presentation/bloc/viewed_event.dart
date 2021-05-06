part of 'viewed_bloc.dart';

abstract class ViewedEvent extends Equatable {
  const ViewedEvent();
}

class FetchViewedArticlesEvent extends ViewedEvent {
  final bool isCachedData;

  FetchViewedArticlesEvent({required this.isCachedData});

  @override
  List<Object> get props => throw UnimplementedError();
}
