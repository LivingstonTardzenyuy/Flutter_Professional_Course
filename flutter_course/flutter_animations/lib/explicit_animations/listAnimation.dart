import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({Key? key}) : super(key: key);

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  final itemCount = 5;
  late List<Animation<Offset>> animations = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(controller);

    animations = List.generate(
      itemCount,
          (index) => Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(index * (1 / itemCount), 1)
          ),
          ),
    );

    // Uncomment the following line if you want the animation to start automatically
    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animations[index],
            child: ListTile(
              title: Text('Hello world, Rivaan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}