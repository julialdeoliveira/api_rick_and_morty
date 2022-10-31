import 'package:flutter/material.dart';

class ListTileProfileInfo extends StatelessWidget {
  const ListTileProfileInfo({
    Key? key,
    required this.title,
    required this.subtile,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final String subtile;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(iconData),
      title: Text(title),
      subtitle: Text(subtile),
    );
  }
}
