import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';
import 'package:rick_morty_and_flutter/core/widgets/fade_in.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  Widget buildCharacterImage() {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: character.image,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }

  Widget buildOverlayGradient() {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.characterCardGradientStart,
              AppColors.characterCardGradientEnd,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCharacterInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            character.name,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: character.status.color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(width: 5),
              Text(
                '${character.status.name} - ${character.species}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          buildCharacterImage(),
          FadeIn(child: buildOverlayGradient()),
          FadeIn(child: buildCharacterInfo(context)),
        ],
      ),
    );
  }
}
