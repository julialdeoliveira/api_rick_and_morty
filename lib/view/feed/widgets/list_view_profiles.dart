import 'package:flutter/material.dart';

class ListViewProfiles extends StatelessWidget {
  const ListViewProfiles({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<dynamic> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/status", arguments: characters[index]);
            characters[index].isStatusViewd = !characters[index].isStatusViewd;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: characters[index].isStatusViewd == true
                              ? Colors.black
                              : null,
                          gradient: characters[index].isStatusViewd == false
                              ? const LinearGradient(colors: [
                                  Colors.pink,
                                  Color.fromRGBO(105, 73, 255, 1),
                                ])
                              : null),
                    ),
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.network(
                          characters[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(characters[index].name),
              ],
            ),
          ),
        );
      },
    );
  }
}
