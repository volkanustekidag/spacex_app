part of 'spacex_bloc.dart';

abstract class SpacexEvent extends Equatable {}

class SpacexRequestEvent extends SpacexEvent {
  SpacexRequestEvent();

  @override
  List<Object> get props => [];
}

class SpacexRefreshEvent extends SpacexEvent {
  SpacexRefreshEvent();

  @override
  List<Object> get props => [];
}
