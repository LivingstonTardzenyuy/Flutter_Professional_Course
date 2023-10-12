import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  final int count = 5;
  late List<Animation<Offset>> animation = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    slideAnimation = Tween(begin: Offset(-1, 0), end: Offset(0,0)).animate(controller);

    animation = List.generate(count, (index) => Tween(begin: Offset(-1,0), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: Interval(index * (1 / count), 1))           //delay time

    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),

      body: ListView.builder(
        itemCount: count,
          itemBuilder: (context, index){
            return SlideTransition(
              position: animation[index],
              child: ListTile(
                title: Text('Hello World, Rivaan. ${index.toString()}'),
              ),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.isCompleted) {
            controller.reverse();
          }
          else{
            controller.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
