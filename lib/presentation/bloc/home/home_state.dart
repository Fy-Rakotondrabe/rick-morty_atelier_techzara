part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;
  final List<CharacterModel> characters;

  const HomeState({
    required this.characters,
    required this.status,
  });

  @override
  List<Object> get props => [
        characters,
        status,
      ];

  HomeState copyWith({
    Status? status,
    List<CharacterModel>? characters,
  }) =>
      HomeState(
        characters: characters ?? this.characters,
        status: status ?? this.status,
      );
}
