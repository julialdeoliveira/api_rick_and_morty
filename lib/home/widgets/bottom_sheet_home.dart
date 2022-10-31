import 'package:flutter/material.dart';

class BottomSheetHome extends StatelessWidget {
  const BottomSheetHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
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
            onTap: () {},
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
