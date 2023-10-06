import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Solution3 extends StatefulWidget {
  const Solution3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Solution3State();
  }
}

class Solution3State extends State<Solution3> {
  double posx = 0;
  double posy = 0;
  final BoxHitTestResult result = BoxHitTestResult();

  Element? findElement(HitTestTarget target) {
    RenderObject? object = target as RenderObject;
    while (object != null) {
      if (object.debugCreator is Element) {
        return object.debugCreator as Element;
      }
      object = object.parent as RenderObject?;
    }
    return null;
  }

  void onTapDown(BuildContext context, TapDownDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    setState(() {
      box.hitTest(result, position: localOffset);
      posx = localOffset.dx;
      posy = localOffset.dy;

      for (var entry in result.path) {
        final target = entry.target;
        if (target is RenderBox) {
          final Element? element = findElement(target);
          if (element != null) {
            print(element.widget.runtimeType);
            break;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (TapDownDetails details) => onTapDown(context, details),
        child: Stack(fit: StackFit.expand, children: <Widget>[
          // 아래의 코드를 수정하였습니다.
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
            ),
          ),
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
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTapDown: (TapDownDetails details) {
                      final BoxHitTestResult result = BoxHitTestResult();
                      RenderBox? box = context.findRenderObject() as RenderBox?;
                      Offset localPosition =
                          box!.globalToLocal(details.globalPosition);
                      box.hitTest(result, position: localPosition);
                      print(result.path.last.target);
                      // for (var target in result.path) {
                      //   if (target.target is RenderParagraph) {
                      //     print('TextWidget이 탭되었습니다.');
                      //   } else if (target.target is RenderBox) {
                      //     print('Container가 탭되었습니다.');
                      //   }
                      //   // 기타 위젯 유형에 따른 조건문을 추가할 수 있습니다.
                      // }
                    },
                    child: const CustomContainer()),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(color: Colors.red));
  }
}
