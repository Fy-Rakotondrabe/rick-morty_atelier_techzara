part of 'favs_bloc.dart';

abstract class FavsEvent extends Equatable {
  const FavsEvent();

  @override
  List<Object> get props => [];
}

class AddToFav extends FavsEvent {
  final CharacterModel character;

  AddToFav({
    required this.character,
  });

  @override
  List<Object> get props => [character];
}

class RemoveFav extends FavsEvent {
  final int id;

  RemoveFav({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetFav extends FavsEvent {}
