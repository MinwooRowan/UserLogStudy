import 'package:flutter/material.dart';

class Solution1 extends StatefulWidget {
  const Solution1({Key? key}) : super(key: key);

  @override
  State<Solution1> createState() => _Solution1State();
}

class _Solution1State extends State<Solution1> {
  double posx = 0;
  double posy = 0;
  void _getTapPosition(TapDownDetails details) async {
    Offset tapPosition = details.globalPosition;
    setState(() {
      posx = tapPosition.dx;
      posy = tapPosition.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _getTapPosition(details),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                'Tapped\nX:$posx \nY:$posy',
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
