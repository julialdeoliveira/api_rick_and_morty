import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/model/character_model.dart';

class ListViewProfiles extends StatelessWidget {
  const ListViewProfiles({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<CharacterModel> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(colors: [
                          Colors.pink,
                          Color.fromRGBO(105, 73, 255, 1),
                        ])),
                  ),
                  const CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.network(
                        characters[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(characters[index].name),
            ],
          ),
        );
      },
    );
  }
}
