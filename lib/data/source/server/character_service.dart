import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_morty_test/core/constants/http_status_code.dart';
import 'package:rick_morty_test/core/constants/network_path.dart';
import 'package:rick_morty_test/core/error/exceptions.dart';
import 'package:rick_morty_test/data/models/character_model.dart';

class CharacterService {
  Future<List<CharacterModel>> getAllCharacter() async {
    try {
      http.Response response = await http.get(
        Uri.parse(NetworkPath.character),
      );

      if (response.statusCode == StatusCode.success) {
        return (jsonDecode(response.body)['results'] as List<dynamic>)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
      } else if (response.statusCode == StatusCode.conflict) {
        throw ConflictException();
      } else if (response.statusCode == StatusCode.badRequest) {
        throw BadRequestException();
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  Future<List<CharacterModel>> getOneCharacter(int id) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${NetworkPath.character}/$id'),
      );

      if (response.statusCode == StatusCode.success) {
        return (jsonDecode(response.body)['results'] as List<dynamic>)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
      } else if (response.statusCode == StatusCode.conflict) {
        throw ConflictException();
      } else if (response.statusCode == StatusCode.badRequest) {
        throw BadRequestException();
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
