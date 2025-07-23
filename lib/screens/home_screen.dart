import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mybox =Hive.box("mybox");
    void toggleTask(int index,bool? value) {
    var current=mybox.getAt(index);
    current[1]=value;
    setState(() {
      mybox.putAt(index, current);
    });
  }

  void deleteTask(int index) {
    setState(() {
      mybox.deleteAt(index);
    });
  }

  void addTaskDialog() {
  String newTaskName = "";

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add a Task"),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: "Enter task name"),
          onChanged: (value) {
            newTaskName = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (newTaskName.trim().isNotEmpty) {
                setState(() {
                  mybox.add([newTaskName,false]);
                });
              }
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text("Add"),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
        backgroundColor: const Color.fromARGB(255, 255, 204, 0),
        foregroundColor: Colors.white,
        elevation: 4, 
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets\\background_image.jpg"),
            fit: BoxFit.cover,
            opacity: 0.8,
            ),
          ),
        ),
      ListView.builder(
        itemCount: mybox.length,
        itemBuilder: (context, index) {
          var task=mybox.getAt(index);
          return TaskTile(
            taskName: task[0],
            isDone: task[1],
            onChanged: (value) => toggleTask(index, value),
            onDelete: () => deleteTask(index),
          );
        },
      )
      ]),
  
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
