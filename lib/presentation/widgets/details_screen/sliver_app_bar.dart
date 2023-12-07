import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/character.dart';

class MySliverAppBar extends StatelessWidget {
  final Character character;

  const MySliverAppBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.green,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name!,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
