import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/models/latest.dart';
import 'package:spacex_app/repositories/spacex_repositories.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpacexBloc extends Bloc<SpacexEvent, SpacexState> {
  final SpacexRepository spacexRepository;

  SpacexBloc({this.spacexRepository}) : super(SpacexInitialState()) {
    on<SpacexRequestEvent>((event, emit) async {
      emit(SpacexLoadingState());

      try {
        final Latest latest = await spacexRepository.fetchLatest();
        emit(SpacexSuccesState(latest: latest));
      } catch (e) {
        emit(SpacexFailureState());
      }
    });

    on<SpacexRefreshEvent>((event, emit) async {
      try {
        final Latest latest = await spacexRepository.fetchLatest();
        emit(SpacexSuccesState(latest: latest));
      } catch (e) {
        emit(SpacexFailureState());
      }
    });
  }
}
