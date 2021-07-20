import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_and_flutter/modules/character/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/repositories/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/use_cases/get_characters.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/bloc/character_bloc.dart';

// Serivce Locator
final sl = GetIt.instance;

void init() {
  //! Features
  // Bloc
  sl.registerFactory(() => CharacterBloc(getCharacters: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetCharacters(sl()));

  // Repositories
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(client: sl()),
  );
  //! Core

  //! External
  sl.registerFactory(() => http.Client());
}
