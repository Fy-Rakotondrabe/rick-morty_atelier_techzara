part of 'favs_bloc.dart';

class FavsState extends Equatable {
  final List<CharacterModel> characters;
  final Status status;

  const FavsState({
    required this.characters,
    required this.status,
  });

  @override
  List<Object> get props => [
        characters,
        status,
      ];

  FavsState copyWith({
    List<CharacterModel>? characters,
    Status? status,
  }) =>
      FavsState(
          characters: characters ?? this.characters,
          status: status ?? this.status);
}
