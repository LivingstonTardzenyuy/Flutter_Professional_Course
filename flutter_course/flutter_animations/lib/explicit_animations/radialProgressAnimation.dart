import 'package:flutter/material.dart';


class RadialProgressAnimation extends StatefulWidget {
  final double progress;
  final Color color;

  const RadialProgressAnimation({
    required this.progress,
    required this.color
  });

  @override
  State<RadialProgressAnimation> createState() => _RadialProgressAnimationState();
}

class _RadialProgressAnimationState extends State<RadialProgressAnimation> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: widget.progress).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,

                  child: CircularProgressIndicator(
                    value: animation.value,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.shade100,
                    color: widget.color,

                  ),
                ),

                Text(
                  '${(animation.value * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            );
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
            if (controller.isCompleted){
              controller.reverse();
            }
            else{
              controller.forward();
            }
          // controller.forward();
        },
      ),
    );
  }
}
