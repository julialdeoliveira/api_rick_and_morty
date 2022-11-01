import 'package:flutter/material.dart';

import 'package:game_stream/view/home/model/character_model.dart';

class StatusPage extends StatelessWidget {
  static const route = "/status";
  final CharacterModel character;
  const StatusPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.indigoAccent,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Divider(
                thickness: 5,
                color: Colors.amber,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
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
                ),
              ),
              const SizedBox(height: 100),
              Image.network(character.image),
            ],
          ),
        ),
      ),
    );
  }
}
