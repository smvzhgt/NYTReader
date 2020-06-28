part of 'viewed_bloc.dart';

abstract class ViewedEvent extends Equatable {
  const ViewedEvent();
}

class FetchViewedArticlesEvent extends ViewedEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
