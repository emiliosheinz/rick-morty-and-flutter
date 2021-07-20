import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/bloc/character_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  void initState() {
    BlocProvider.of<CharacterBloc>(context).add(GetCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: Center(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is Loading) {
              return Text("Loading");
            }

            if (state is Error) {
              return Text("Error loading data");
            }

            if (state is Loaded) {
              print(state.characters);
              return Text("Characters...");
            }

            return Text("Nothing to show here");
          },
        ),
      ),
    );
  }
}
