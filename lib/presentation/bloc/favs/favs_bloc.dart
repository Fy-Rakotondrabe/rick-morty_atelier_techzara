import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_test/core/constants/status.dart';
import 'package:rick_morty_test/data/models/character_model.dart';
import 'package:rick_morty_test/data/repository/favs_repository.dart';

part 'favs_event.dart';
part 'favs_state.dart';

class FavsBloc extends Bloc<FavsEvent, FavsState> {
  final FavsRepository favsRepository;

  FavsBloc({
    required this.favsRepository,
  }) : super(FavsState(characters: [], status: Status.empty)) {
    on<AddToFav>(_addToFav);
    on<GetFav>(_getFav);
    on<RemoveFav>(_removeFav);
  }

  Future<void> _addToFav(
    AddToFav event,
    Emitter<FavsState> emit,
  ) async {
    await favsRepository.addFav(event.character);
    var chars = [...state.characters, event.character];
    emit(state.copyWith(characters: chars));
  }

  Future<void> _removeFav(
    RemoveFav event,
    Emitter<FavsState> emit,
  ) async {
    await favsRepository.removeFav(event.id);
    var chars = state.characters
        .where(
          (element) => element.id != event.id,
        )
        .toList();
    emit(state.copyWith(characters: chars));
  }

  Future<void> _getFav(
    GetFav event,
    Emitter<FavsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    var chars = await favsRepository.getFavs();
    emit(state.copyWith(status: Status.loaded, characters: chars));
  }
}
