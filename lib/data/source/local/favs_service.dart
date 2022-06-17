import 'dart:convert';

import 'package:rick_morty_test/core/constants/prefs_keys.dart';
import 'package:rick_morty_test/data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavsService {
  Future<void> addFavs(CharacterModel character) async {
    final prefs = await SharedPreferences.getInstance();

    var favs = prefs.getStringList(PrefKeys.favs) ?? [];
    favs.add(jsonEncode(character.toJson()));
    await prefs.setStringList(PrefKeys.favs, favs);
  }

  Future<void> removeFav(int id) async {
    final prefs = await SharedPreferences.getInstance();

    var favs = prefs.getStringList(PrefKeys.favs) ?? [];
    favs.removeWhere(
        (element) => CharacterModel.fromJson(jsonDecode(element)).id == id);
    await prefs.setStringList(PrefKeys.favs, favs);
  }

  Future<List<CharacterModel>> getFavs() async {
    final prefs = await SharedPreferences.getInstance();

    var favs = prefs.getStringList(PrefKeys.favs) ?? [];
    var result = favs
        .map(
          (e) => CharacterModel.fromJson(jsonDecode(e)),
        )
        .toList();
    return result;
  }
}
