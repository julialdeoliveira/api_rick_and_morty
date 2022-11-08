import 'package:flutter/material.dart';

import 'package:game_stream/view/home/model/character_model.dart';

import 'widgets/list_tile_profile_info.dart';

class ProfilePage extends StatelessWidget {
  static const route = "/profiles";
  final CharacterModel character;
  const ProfilePage({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(character.image),
                ListTileProfileInfo(
                  title: 'Gender',
                  subtile: character.gender,
                  iconData:
                      character.gender == "Male" ? Icons.male : Icons.female,
                ),
                const Divider(),
                ListTileProfileInfo(
                  title: 'Status',
                  subtile: character.status,
                  iconData: Icons.favorite,
                  iconColor:
                      character.status == 'Alive' ? Colors.red : Colors.grey,
                ),
                const Divider(),
                ListTileProfileInfo(
                  title: 'Planet',
                  subtile: character.origin.name,
                  iconData: Icons.public_off,
                ),
                const Divider(),
                ListTileProfileInfo(
                  title: 'Location',
                  subtile: character.location.name,
                  iconData: Icons.location_on,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
