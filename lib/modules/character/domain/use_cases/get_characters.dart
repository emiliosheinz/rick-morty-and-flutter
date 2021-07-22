import 'package:dartz/dartz.dart';
import 'package:rick_morty_and_flutter/shared/error/failures.dart';
import 'package:rick_morty_and_flutter/shared/use_cases/use_case.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/repositories/character.dart';

class GetCharacters implements UseCase<List<Character>> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call() async {
    return await repository.getCharacters();
  }
}
