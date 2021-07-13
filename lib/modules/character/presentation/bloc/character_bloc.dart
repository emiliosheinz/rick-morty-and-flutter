import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(Empty());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
