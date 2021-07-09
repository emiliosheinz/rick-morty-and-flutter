import 'package:dartz/dartz.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

abstract class CharacterRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character endpoint.
  ///
  /// Throws a _ServerException_ fro all error codes.
  Future<List<Character>> getCharacters();
}
