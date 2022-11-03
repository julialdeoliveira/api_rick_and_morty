import 'package:flutter/material.dart';

import '../../../shared/templates/row_profile_info.dart';
import '../../home/model/character_model.dart';

class PostStatusInkWell extends StatelessWidget {
  final CharacterModel character;
  const PostStatusInkWell({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/profiles", arguments: character);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 350,
              width: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: RowProfileInfo(character: character),
                  ),
                  Image.network(character.image),
                ],
              )),
          Text(
            '@${character.name}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
