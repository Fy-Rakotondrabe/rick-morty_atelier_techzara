import 'package:rick_morty_test/data/models/character_model.dart';
import 'package:rick_morty_test/data/source/local/favs_service.dart';

class FavsRepository {
  final FavsService service;
  FavsRepository({
    required this.service,
  });

  Future<void> addFav(CharacterModel character) async {
    await service.addFavs(character);
  }

  Future<void> removeFav(int id) async {
    await service.removeFav(id);
  }

  Future<List<CharacterModel>> getFavs() async {
    return await service.getFavs();
  }
}
