import 'package:flutter/material.dart';
import 'package:td2_2223/models/task.dart';

class Ecran1 extends StatelessWidget{
  List<Task> tasks = Task.generateTask(50);
  String tags='';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder:(context,index)=>Card(
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(child: Text(tasks[index].id.toString()),backgroundColor: Colors.lightBlue,),
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].tags.join(" ")),
          ),
        ));
  }

}