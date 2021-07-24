import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:rick_morty_and_flutter/core/error/exceptions.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/character/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

import 'character_repository_impl_test.mocks.dart';

@GenerateMocks([CharacterRemoteDataSource])
void main() {
  late MockCharacterRemoteDataSource remoteDataSource;
  late CharacterRepositoryImpl repositoryImpl;

  setUp(() {
    remoteDataSource = MockCharacterRemoteDataSource();
    repositoryImpl =
        CharacterRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group('getCharacters', () {
    final characters = [
      Character(
        id: 1,
        name: "Test Name",
        image: "image.png",
        species: "Human",
        status: CharacterStatus.alive,
      )
    ];

    test(
        'should return a list of Characters when call to remote data source is successful',
        () async {
      when(remoteDataSource.getCharacters())
          .thenAnswer((_) async => characters);

      final result = await repositoryImpl.getCharacters();

      expect(result.isRight(), true);
      expect(result, Right(characters));
      expect(result.getOrElse(() => []), characters);
    });

    test(
        'should return a ServerFailure when call to remote data source is unsuccessful',
        () async {
      when(remoteDataSource.getCharacters())
          .thenThrow(ServerException("Server exception"));

      final result = await repositoryImpl.getCharacters();

      verify(remoteDataSource.getCharacters());
      expect(result.isLeft(), true);
      expect(result, Left(ServerFailure()));
    });
  });
}
