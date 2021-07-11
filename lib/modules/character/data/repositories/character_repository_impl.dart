import 'package:rick_morty_and_flutter/core/error/exceptions.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/repositories/character.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Character>>> getCharacters() async {
    try {
      final characters = await remoteDataSource.getCharacters();
      return Right(characters);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
