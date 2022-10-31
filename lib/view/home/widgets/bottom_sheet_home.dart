import 'package:flutter/material.dart';

import 'package:game_stream/view/feed/feed_page.dart';
import 'package:game_stream/view/home/model/character_model.dart';

class BottomSheetHome extends StatelessWidget {
  final List<CharacterModel> characters;
  const BottomSheetHome({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            child: const Chip(
              label: Text(
                'Skip',
                style: TextStyle(color: Color.fromRGBO(105, 73, 255, 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Color.fromRGBO(240, 237, 255, 1),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return FeedPage(
                    characters: characters,
                  );
                },
              ));
            },
            child: const Chip(
              label: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Color.fromRGBO(105, 73, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}
