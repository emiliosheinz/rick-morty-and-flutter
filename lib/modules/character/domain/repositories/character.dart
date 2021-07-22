import 'package:dartz/dartz.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters();
}
