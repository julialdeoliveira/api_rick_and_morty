import 'package:flutter/material.dart';

import 'package:game_stream/view/feed/feed_page.dart';
import 'package:game_stream/view/liked/liked_page.dart';
import 'package:game_stream/view/saved/saved_page.dart';

class CustomNavigationBar extends StatefulWidget {
  final int index;
  const CustomNavigationBar({
    super.key,
    required this.index,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late PageController controller;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, LikedPage.route);
        break;
      case 1:
        Navigator.pushNamed(context, FeedPage.route);
        break;
      case 2:
        Navigator.pushNamed(context, SavedPage.route);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.index,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(105, 73, 255, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Saved',
          ),
        ]);
  }
}
