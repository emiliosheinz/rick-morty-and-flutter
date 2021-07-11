import 'dart:convert';

import 'package:rick_morty_and_flutter/core/error/exceptions.dart';
import 'package:rick_morty_and_flutter/modules/character/data/models/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';

import 'package:http/http.dart' as http;

abstract class CharacterRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character endpoint.
  ///
  /// Throws a _ServerException_ fro all error codes.
  Future<List<Character>> getCharacters();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Character>> getCharacters() async {
    final response = await client
        .get(Uri.parse("https://rickandmortyapi.com/api/character"));

    if (response.statusCode == 200) {
      final List<dynamic> charactersFromApi =
          jsonDecode(response.body)['results'];

      final characters = charactersFromApi
          .map((char) => CharacterModel.fromJson(char))
          .toList();

      return characters;
    } else {
      throw ServerException("An error occurred while getting the characters.");
    }
  }
}
