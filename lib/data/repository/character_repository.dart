import 'package:rick_morty_test/core/error/exceptions.dart';
import 'package:rick_morty_test/core/error/failure.dart';
import 'package:rick_morty_test/data/models/character_model.dart';
import 'package:rick_morty_test/data/source/server/character_service.dart';
import 'package:multiple_result/multiple_result.dart';

class CharacterRepository {
  final CharacterService service;

  CharacterRepository({
    required this.service,
  });

  Future<Result<Failure, List<CharacterModel>>> getAllCharacters() async {
    try {
      final result = await service.getAllCharacter();
      return Success(result);
    } on ConflictException {
      return Error(ConflictFailure());
    } on BadRequestException {
      return Error(BadRequestFailure());
    } on ServerException {
      return Error(ServerFailure());
    } on UnauthorizedException {
      return Error(UnauthorizedFailure());
    }
  }

  Future<Result<Failure, List<CharacterModel>>> getOneCharacter(int id) async {
    try {
      final result = await service.getOneCharacter(id);
      return Success(result);
    } on ConflictException {
      return Error(ConflictFailure());
    } on BadRequestException {
      return Error(BadRequestFailure());
    } on ServerException {
      return Error(ServerFailure());
    } on UnauthorizedException {
      return Error(UnauthorizedFailure());
    }
  }
}
