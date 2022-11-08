import 'package:flutter/material.dart';

class AppBarFeed extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFeed({super.key});

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Feed'),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/home");
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
