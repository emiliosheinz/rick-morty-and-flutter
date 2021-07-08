import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/repositories/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/use_cases/get_characters.dart';

import 'get_characters_test.mocks.dart';

@GenerateMocks([CharacterRepository])
void main() {
  late MockCharacterRepository repository;
  late GetCharacters useCase;
  setUp(() {
    repository = MockCharacterRepository();
    useCase = GetCharacters(repository);
  });

  test(
    'should get the list of characters',
    () async {
      final characters = [
        Character(id: 1, name: "Nome Teste", image: "image.png"),
        Character(id: 2, name: "Nome Teste 2", image: "image2.png")
      ];

      when(repository.getCharacters())
          .thenAnswer((_) async => Right(characters));

      final result = await useCase();

      expect(result.isRight(), true);
      expect(result, Right(characters));
      expect(result.getOrElse(() => []), characters);
    },
  );
}
