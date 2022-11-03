import 'package:flutter/material.dart';

class ContainerBottomSheetStatus extends StatefulWidget {
  ContainerBottomSheetStatus({
    Key? key,
  }) : super(key: key);
  bool isFavorite = false;
  @override
  State<ContainerBottomSheetStatus> createState() =>
      _ContainerBottomSheetStatusState();
}

class _ContainerBottomSheetStatusState
    extends State<ContainerBottomSheetStatus> {
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
              widget.isFavorite = !widget.isFavorite;
              setState(() {});
            },
            icon: Icon(Icons.favorite,
                color: widget.isFavorite ? Colors.pink : Colors.white),
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
