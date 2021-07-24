import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_and_flutter/core/services/navigation.dart';
import 'package:rick_morty_and_flutter/core/themes/app_themes.dart';
import 'package:rick_morty_and_flutter/injection_container.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/pages/characters_page.dart';

import 'modules/character/presentation/bloc/character_bloc.dart';

void main() {
  inject();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<CharacterBloc>()),
      ],
      child: MaterialApp(
        title: 'RickMortyAndFlutter',
        theme: AppThemes.primary,
        navigatorKey: serviceLocator<NavigationService>().navigatorKey,
        initialRoute: CharactersPage.routeName,
        routes: {
          CharactersPage.routeName: (context) => CharactersPage(),
        },
      ),
    );
  }
}
