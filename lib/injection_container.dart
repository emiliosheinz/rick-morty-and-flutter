import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty_and_flutter/core/services/navigation.dart';
import 'package:rick_morty_and_flutter/modules/character/data/repositories/character_repository_impl.dart';
import 'package:rick_morty_and_flutter/modules/character/data/sources/character_remote_data_source.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/repositories/character.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/use_cases/get_characters.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/bloc/character_bloc.dart';

final serviceLocator = GetIt.instance;

void inject() {
  //! Features
  // Bloc
  serviceLocator
      .registerFactory(() => CharacterBloc(getCharacters: serviceLocator()));

  // Use Cases
  serviceLocator.registerLazySingleton(() => GetCharacters(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(client: serviceLocator()),
  );
  //! Core
  //Services
  serviceLocator.registerLazySingleton(() => NavigationService());

  //! External
  serviceLocator.registerFactory(() => http.Client());
}
