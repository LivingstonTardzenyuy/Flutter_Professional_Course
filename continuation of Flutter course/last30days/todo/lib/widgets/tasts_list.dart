import 'package:flutter/material.dart';
import 'package:todo/widgets/tast_tile.dart';

class TaskList extends StatelessWidget {

  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(),
        TaskTile(),
        TaskTile(),
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}

