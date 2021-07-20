import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_and_flutter/injection_container.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/pages/characters_page.dart';

import 'modules/character/presentation/bloc/character_bloc.dart';

void main() {
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => serviceLocator<CharacterBloc>(),
        child: CharactersPage(),
      ),
    );
  }
}
