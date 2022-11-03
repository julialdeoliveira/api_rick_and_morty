import 'package:flutter/material.dart';

import '../../home/model/character_model.dart';

class RowInfoStatus extends StatelessWidget {
  final CharacterModel character;
  const RowInfoStatus({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(character.image),
        ),
        const SizedBox(width: 10),
        Text(
          character.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ],
    );
  }
}
