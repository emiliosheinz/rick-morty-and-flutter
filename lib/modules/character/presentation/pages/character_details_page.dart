import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';
import 'package:rick_morty_and_flutter/core/services/navigation.dart';
import 'package:rick_morty_and_flutter/injection_container.dart';
import 'package:rick_morty_and_flutter/modules/character/domain/entities/character.dart';
import 'package:rick_morty_and_flutter/modules/character/shared/enums/character_status.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterDetailsPageArguments {
  Character character;

  CharacterDetailsPageArguments({
    required this.character,
  });
}

class CharacterDetailsPage extends StatelessWidget {
  static final String routeName = '/character-details';

  const CharacterDetailsPage({Key? key}) : super(key: key);

  Widget _buildSliverAppBarTitle(
    BuildContext context, {
    required String characterName,
    required CharacterStatus characterStatus,
    required String characterSpecies,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            characterName,
            textAlign: TextAlign.right,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: characterStatus.color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${characterStatus.name} - $characterSpecies',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBarBackground({required String image}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: image,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.characterDetailsGradientStart,
                  AppColors.characterDetailsGradientEnd,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = serviceLocator<NavigationService>()
        .getScreenArguments<CharacterDetailsPageArguments>(context);
    final character = arguments.character;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.5,
            elevation: 0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: _buildSliverAppBarTitle(
                context,
                characterName: character.name,
                characterStatus: character.status,
                characterSpecies: character.species,
              ),
              background: _buildSliverAppBarBackground(
                image: character.image,
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([]))
        ],
      ),
    );
  }
}
