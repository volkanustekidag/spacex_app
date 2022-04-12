part of 'spacex_bloc.dart';

abstract class SpacexState extends Equatable {
  const SpacexState();
  List<Object> get props => [];
}

class SpacexInitialState extends SpacexState {
  @override
  List<Object> get props => [];
}

class SpacexSuccesState extends SpacexState {
  final Latest latest;

  const SpacexSuccesState({this.latest});

  @override
  List<Object> get props => [latest];
}

class SpacexLoadingState extends SpacexState {}

class SpacexFailureState extends SpacexState {}
