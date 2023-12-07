import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/utils/constants.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              navigateToCharacterDetails(context);
            },
            child: _CharacterCard(
              character: character,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToCharacterDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      Constants.CHARACTER_DETAILS_SCREEN,
      arguments: character,
    );
  }
}

class _CharacterCard extends StatelessWidget {
  final Character character;

  const _CharacterCard({required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                character.name!,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child:
              Hero(
                tag: character.id!,
                child: FadeInImage.assetNetwork(
                  image: character.image!,
                  placeholder: "assets/images/loading.gif",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
