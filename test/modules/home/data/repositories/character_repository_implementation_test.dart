import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:rick_morty_and_flutter/core/error/exceptions.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/character/data/repositories/character_repository_implementation.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

import 'character_repository_implementation_test.mocks.dart';

@GenerateMocks([CharacterRemoteDataSource])
void main() {
  late MockCharacterRemoteDataSource remoteDataSource;
  late CharacterRepositoryImplementation repositoryImplementation;

  setUp(() {
    remoteDataSource = MockCharacterRemoteDataSource();
    repositoryImplementation =
        CharacterRepositoryImplementation(remoteDataSource: remoteDataSource);
  });

  group('getCharacters', () {
    final characters = [
      Character(id: 1, name: "Test Name", image: "image.png")
    ];

    test(
        'should return a list of Characters when call to remote data source is successful',
        () async {
      when(remoteDataSource.getCharacters())
          .thenAnswer((_) async => characters);

      final result = await repositoryImplementation.getCharacters();

      expect(result.isRight(), true);
      expect(result, Right(characters));
      expect(result.getOrElse(() => []), characters);
    });

    test(
        'should return a ServerFailure when call to remote data source is unsuccessful',
        () async {
      when(remoteDataSource.getCharacters())
          .thenThrow(ServerException("Server exception"));

      final result = await repositoryImplementation.getCharacters();

      verify(remoteDataSource.getCharacters());
      expect(result.isLeft(), true);
      expect(result, Left(ServerFailure()));
    });
  });
}
