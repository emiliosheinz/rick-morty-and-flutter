import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/widgets/character_card.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;

  const CharactersList({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: characters.length,
        itemBuilder: (ctx, index) {
          return CharacterCard(character: characters[index]);
        },
      ),
    );
  }
}
