import 'package:flutter/material.dart';

class ReplacementIfListIsEmpty extends StatelessWidget {
  const ReplacementIfListIsEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          Image.asset("lib/assets/images/undraw_feeling_blue_4b7q.png"),
          Text(
            'Looks like you have \nnothing here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade500,
              letterSpacing: 3,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
