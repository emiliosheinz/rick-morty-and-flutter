import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  Widget buildCharacterImage() {
    return Image.network(
      character.image,
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
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCharacterInfo() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            character.name,
            style: TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(width: 5),
              Text(
                '${character.status.name} - Human',
                style: TextStyle(color: AppColors.text),
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
      color: Colors.white60,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          buildCharacterImage(),
          buildOverlayGradient(),
          buildCharacterInfo(),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
