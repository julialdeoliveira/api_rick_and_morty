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
      body: Column(
        children: const [Text('status')],
      ),
    );
  }
}
