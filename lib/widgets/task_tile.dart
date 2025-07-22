import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget{
  final String taskName;
  final bool isDone;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(5),),
          child: ListTile(
            leading: Checkbox(
              value: isDone, 
              onChanged: onChanged, 
              activeColor: Theme.of(context).primaryColor,),
          title: Text(
            taskName,
            style: TextStyle(
              fontSize: 16,
              decoration: isDone? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: IconButton(
            onPressed: onDelete, 
            icon: Icon(Icons.delete,color:const Color.fromARGB(129, 0, 0, 0))
          ),
          )
      )
    );
  }
}

          
   