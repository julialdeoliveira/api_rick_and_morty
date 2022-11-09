import 'package:flutter/material.dart';

class ContainerBottomSheetStatus extends StatefulWidget {
  const ContainerBottomSheetStatus({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerBottomSheetStatus> createState() =>
      _ContainerBottomSheetStatusState();
}

class _ContainerBottomSheetStatusState
    extends State<ContainerBottomSheetStatus> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: Colors.black,
      child: Row(
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Send a message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              isFavorite = !isFavorite;
              setState(() {});
            },
            icon: Icon(Icons.favorite,
                color: isFavorite ? Colors.pink : Colors.white),
          ),
          const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
