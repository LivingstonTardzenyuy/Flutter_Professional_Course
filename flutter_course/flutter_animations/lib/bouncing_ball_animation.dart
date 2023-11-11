
import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }
      else if (status == AnimationStatus.dismissed){
        controller.forward();
      }

    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => CustomPaint(
                size: const Size(200, 500),
                painter: BouncingBallPainter(animation.value),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BouncingBallPainter extends CustomPainter{

  final double animationValue;
  BouncingBallPainter(this.animationValue){
    print(animationValue);
  }
  @override
  void paint(Canvas canvas, Size size) {
      canvas.drawCircle(Offset(
          size.width/2, size.height - (size.height * animationValue)),
          70,
          Paint()..color= Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}