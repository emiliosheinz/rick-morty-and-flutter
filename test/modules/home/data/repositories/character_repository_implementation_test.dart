import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:rick_morty_and_flutter/modules/character/data/repositories/character_repository_implementation.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';

import 'character_repository_implementation_test.mocks.dart';

@GenerateMocks([CharacterRemoteDataSource])
void main() {
  late MockCharacterRemoteDataSource remoteDataSource;
  late CharacterRepositoryImplementation repository;

  setUp(() {
    remoteDataSource = MockCharacterRemoteDataSource();
    repository =
        CharacterRepositoryImplementation(remoteDataSource: remoteDataSource);
  });
}
