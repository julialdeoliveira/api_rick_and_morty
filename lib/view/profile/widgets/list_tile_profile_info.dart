import 'package:flutter/material.dart';

class ListTileProfileInfo extends StatelessWidget {
  const ListTileProfileInfo(
      {Key? key,
      required this.title,
      required this.subtile,
      required this.iconData,
      this.iconColor})
      : super(key: key);

  final String title;
  final String subtile;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        iconData,
        color: iconColor,
      ),
      title: Text(title),
      subtitle: Text(subtile),
    );
  }
}
