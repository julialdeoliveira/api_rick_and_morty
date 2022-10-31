import 'package:flutter/material.dart';
import 'package:game_stream/profile/profile_page.dart';

import '../../models/characters/model/character_model.dart';

class HomePageBody extends StatelessWidget {
  final List<CharacterModel> characters;
  const HomePageBody({
    Key? key,
    required this.characters,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: const Icon(
                  Icons.mic,
                  color: Colors.indigo,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0)),
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
            ),
          ),
          const Text(
            'Select some accounts to follow',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Follow some people  that you  \n may know below',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              scrollDirection: Axis.vertical,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(characters[index].name),
                    subtitle: Text(characters[index].species),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(characters[index].image),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage(character: characters[index]);
                          },
                        ));
                      },
                      child: const Chip(
                        label: Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: Color.fromRGBO(105, 73, 255, 1),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
