import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_test/core/constants/status.dart';
import 'package:rick_morty_test/core/error/failure.dart';
import 'package:rick_morty_test/data/models/character_model.dart';
import 'package:rick_morty_test/data/repository/character_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CharacterRepository characterRepository;

  HomeBloc({
    required this.characterRepository,
  }) : super(HomeState(
          characters: [],
          status: Status.empty,
        )) {
    on<OnFind>(_onFind);
  }

  Future<void> _onFind(
    OnFind event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    var result = await characterRepository.getAllCharacters();

    if (result.isSuccess()) {
      emit(
        state.copyWith(
          status: Status.loaded,
          characters: result.getSuccess(),
        ),
      );
    } else if (result.isError()) {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      }
    }
  }
}
