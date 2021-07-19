import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/use_cases/get_characters.dart';

part 'character_event.dart';
part 'character_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc({required this.getCharacters}) : super(Empty());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    if (event is GetCharactersEvent) {
      final getCharactersEither = await getCharacters();

      yield* getCharactersEither.fold((failure) async* {
        yield Error(message: SERVER_FAILURE_MESSAGE);
      }, (r) => throw UnimplementedError());
    }
  }
}
