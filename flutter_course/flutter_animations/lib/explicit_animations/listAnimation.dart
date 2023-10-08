import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> with SingleTickerProviderStateMixin {
  @override

  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late List<Animation<Offset>> animation = [];
  final int itemCount =5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));

    slideAnimation = Tween(begin: Offset(-1, 0), end: Offset.zero).animate(controller);


    animation = List.generate(itemCount, (index) => Tween(begin: const Offset(-1,0), end: Offset.zero).animate(
        CurvedAnimation(parent: controller, curve: Interval(index *(1 / itemCount), 1))));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
            return SlideTransition(
              position: animation[index],
              child: ListTile(
                title: Text('Hello Word, Rivann. ${index.toString()}'),
              ),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();

        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
