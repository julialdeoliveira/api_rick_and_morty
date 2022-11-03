import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/row_profile_info.dart';

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
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/feed");
          },
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
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/profiles", arguments: character);
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: RowProfileInfo(character: character),
                              ),
                              Image.network(character.image),
                            ],
                          )),
                      Text(
                        '@${character.name}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Send a message',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite, color: Colors.white),
                    const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
