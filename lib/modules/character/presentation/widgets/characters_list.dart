import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/widgets/shimmer_loader.dart';
import 'package:rick_morty_and_flutter/core/widgets/shimmer_provider.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/presentation/widgets/character_card.dart';

const _LOADING_CARDS_TO_RENDER = 10;

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  final bool isLoading;

  const CharactersList({
    Key? key,
    required this.characters,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerProvider(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          cacheExtent: double.maxFinite,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: isLoading ? _LOADING_CARDS_TO_RENDER : characters.length,
          itemBuilder: (ctx, index) {
            if (isLoading) {
              return ShimmerLoader(
                child: Card(),
              );
            }

            return CharacterCard(character: characters[index]);
          },
        ),
      ),
    );
  }
}
