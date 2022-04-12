import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpacexBloc extends Bloc<SpacexEvent, SpacexState> {
  SpacexBloc() : super(SpacexInitialState()) {
    on<SpacexEvent>((event, emit) {});
  }
}
