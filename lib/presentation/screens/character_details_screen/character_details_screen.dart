import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/presentation/widgets/details_screen/info_widget.dart';
import 'package:rick_and_morty/presentation/widgets/details_screen/sliver_app_bar.dart';
import 'package:rick_and_morty/utils/mappers.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        MySliverAppBar(
          character: character,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InfoWidget(title: "species", value: character.species!),
                  const SizedBox(
                    height: 8,
                  ),
                  InfoWidget(title: "status", value: character.status!),
                  const SizedBox(
                    height: 8,
                  ),
                  InfoWidget(title: "gender", value: character.gender!),
                  const SizedBox(
                    height: 8,
                  ),
                  InfoWidget(title: "origin", value: character.origin!.name!),
                  const SizedBox(
                    height: 8,
                  ),
                  InfoWidget(
                      title: "location", value: character.location!.name!),
                  const SizedBox(
                    height: 8,
                  ),
                  InfoWidget(
                      title: "episode",
                      value: Mappers.mapEpisodesToString(character.episode!)),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}
