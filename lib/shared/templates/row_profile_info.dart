import 'package:flutter/material.dart';

import '../../view/home/model/character_model.dart';

class RowProfileInfo extends StatelessWidget {
  final CharacterModel character;
  const RowProfileInfo({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(character.image),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(character.name),
            Text(character.location["name"]),
          ],
        ),
        const Spacer(),
        const Icon(Icons.more_vert),
      ],
    );
  }
}
