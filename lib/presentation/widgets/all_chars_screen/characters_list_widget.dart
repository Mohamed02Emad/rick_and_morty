import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/widgets/all_chars_screen/character_widget.dart';

import '../../../data/models/character.dart';

class CharactersListWidget extends StatefulWidget {
  final List<Character>? data;

  const CharactersListWidget(this.data, {super.key});

  @override
  State<CharactersListWidget> createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return const Center(
        child: Text("No Characters Fount"),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              itemCount: widget.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 12,
              ),
              padding: const EdgeInsets.all(0),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return widget.data?[index] == null
                    ? const Text("Error")
                    : CharacterWidget(character: widget.data![index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
