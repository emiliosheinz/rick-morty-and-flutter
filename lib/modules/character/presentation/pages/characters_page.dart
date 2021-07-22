import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/bloc/character_bloc.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';

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
              return Container(
                color: AppColors.background,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.characters.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.network(
                              state.characters[index].image,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            FractionallySizedBox(
                              heightFactor: 0.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    state.characters[index].name,
                                    style: TextStyle(
                                      color: AppColors.text,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
              );
            }

            return Text("Nothing to show here");
          },
        ),
      ),
    );
  }
}
