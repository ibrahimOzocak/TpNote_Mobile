import 'package:flutter/material.dart';
import 'package:td2/mytheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/Task.dart';
import 'package:td2/home.dart';

class ecrand1 extends StatelessWidget {
  List<Task> tasks = Task.generateTask(50);
  String tags = '';

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue,
            child: Text(tasks[index].id.toString()),
          ),
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].tags.join(" ")),
        ),
      ),
    );
  }
}