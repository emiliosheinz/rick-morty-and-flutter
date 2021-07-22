import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_and_flutter/core/error/exceptions.dart';
import 'package:rick_morty_and_flutter/modules/character/data/models/character.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'character_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  late CharacterRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = CharacterRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
      (realInvocation) async => http.Response(fixture("characters.json"), 200),
    );
  }

  void setUpMockHttpClientFailure400() {
    when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
      (realInvocation) async => http.Response("Something wen wrong", 404),
    );
  }

  group("getCharacters", () {
    final List<dynamic> charactersFromFixture =
        jsonDecode(fixture("characters.json"))['results'];
    final characters =
        charactersFromFixture.map((e) => CharacterModel.fromJson(e)).toList();

    test(
      "should perform a GET request on a URL with no parameters",
      () async {
        setUpMockHttpClientSuccess200();

        await dataSource.getCharacters();

        verify(
          mockHttpClient.get(
            Uri.parse("https://rickandmortyapi.com/api/character"),
          ),
        );
      },
    );

    test(
      "should return a list of Characters when the response code is 200 (success)",
      () async {
        setUpMockHttpClientSuccess200();

        final result = await dataSource.getCharacters();

        expect(result, characters);
      },
    );

    test(
      "should throw a ServerException when the response code is not successful",
      () async {
        setUpMockHttpClientFailure400();

        final call = dataSource.getCharacters;

        expect(() => call(), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
