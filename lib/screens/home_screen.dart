import 'package:flutter/material.dart';
import 'package:todoapp/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> taskList = [
    {'name': 'Buy Milk', 'isDone': false},
    {'name':"go to college","isDone":true}
  ];

  void toggleTask(int index, bool? value) {
    setState(() {
      taskList[index]['isDone'] = value!;
    });
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
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
                  taskList.add({
                    'name': newTaskName,
                    'isDone': false,
                  });
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
      appBar: AppBar(title: Text("TO DO LIST")),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskName: taskList[index]['name'],
            isDone: taskList[index]['isDone'],
            onChanged: (value) => toggleTask(index, value),
            onDelete: () => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
