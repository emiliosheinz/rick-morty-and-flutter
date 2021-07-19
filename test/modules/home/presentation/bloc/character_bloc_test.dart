import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/use_cases/get_characters.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/bloc/character_bloc.dart';

import 'character_bloc_test.mocks.dart';

@GenerateMocks([GetCharacters])
main() {
  late CharacterBloc bloc;
  late MockGetCharacters getCharacters;

  setUp(() {
    getCharacters = MockGetCharacters();
    bloc = CharacterBloc(getCharacters: getCharacters);
  });

  test('initialState should be Empty', () {
    expect(bloc.state, Empty());
  });

  group('getCharacters', () {
    final characters = [
      Character(id: 1, name: "Nome Teste", image: "image.png"),
      Character(id: 2, name: "Nome Teste 2", image: "image2.png")
    ];

    test('should get data from getCharacters use case', () async {
      when(getCharacters()).thenAnswer((_) async => Right(characters));

      bloc.add(GetCharactersEvent());
      await untilCalled(getCharacters());

      verify(getCharacters());
    });

    test('should emit [Loading, Error] state when the server fails', () async {
      when(getCharacters()).thenAnswer((_) async => Left(ServerFailure()));

      final events = [Loading(), Error(message: SERVER_FAILURE_MESSAGE)];
      expectLater(
        bloc.stream,
        emitsInOrder(events),
      );

      bloc.add(GetCharactersEvent());
    });

    test('should emit [Loading, Loaded] state when data is gotten successfully',
        () async {
      when(getCharacters()).thenAnswer((_) async => Right(characters));

      final events = [Loading(), Loaded(characters: characters)];
      expectLater(
        bloc.stream,
        emitsInOrder(events),
      );

      bloc.add(GetCharactersEvent());
    });
  });
}
