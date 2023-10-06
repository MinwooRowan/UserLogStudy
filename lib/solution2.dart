import 'package:flutter/material.dart';

class Solution2 extends StatefulWidget {
  const Solution2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Solution2State();
  }
}

class Solution2State extends State<Solution2> {
  double posx = 0;
  double posy = 0;

  void onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    setState(() {
      posx = localOffset.dx;
      posy = localOffset.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector that will detect the ontap
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) => onTapDown(context, details),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Container(color: Colors.white),
          Padding(
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
        ]),
      ),
    );
  }
}
