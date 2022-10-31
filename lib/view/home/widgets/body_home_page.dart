import 'package:flutter/material.dart';

import '../model/character_model.dart';
import '../../profile/profile_page.dart';

class HomePageBody extends StatefulWidget {
  final List<CharacterModel> characters;
  const HomePageBody({
    Key? key,
    required this.characters,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool follow = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextFormField(
              controller: widget.searchController,
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
              itemCount: widget.characters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ProfilePage(
                              character: widget.characters[index]);
                        },
                      ));
                    },
                    child: ListTile(
                      title: Text(widget.characters[index].name),
                      subtitle: Text(widget.characters[index].species),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(widget.characters[index].image),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            follow = !follow;
                          });
                        },
                        child: Chip(
                          key: Key([index].toString()),
                          side: !follow
                              ? const BorderSide(
                                  color: Color.fromRGBO(105, 73, 255, 1),
                                )
                              : null,
                          label: Text(
                            follow ? 'Follow' : 'Unfollow',
                            style: TextStyle(
                                color: follow
                                    ? Colors.white
                                    : const Color.fromRGBO(105, 73, 255, 1)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: follow
                              ? const Color.fromRGBO(105, 73, 255, 1)
                              : Colors.white,
                        ),
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
