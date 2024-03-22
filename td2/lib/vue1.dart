import 'package:flutter/material.dart';

import 'models/task.dart';

class Ecran1 extends StatelessWidget {
  final List<Task> mesTaches = Task.generateTask(20);
  //final List<int> colorCodes = <int>[50,100,150,200];

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: mesTaches.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.greenAccent[((25 * index) % 900) + 50],
          child: Center(child: Text(mesTaches[index].title)),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
