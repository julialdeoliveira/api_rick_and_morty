import 'package:flutter/material.dart';

import 'package:game_stream/view/feed/feed_page.dart';

class BottomSheetHome extends StatelessWidget {
  final TextEditingController searchController;
  const BottomSheetHome({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              searchController.clear();
            },
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
                  return const FeedPage();
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
