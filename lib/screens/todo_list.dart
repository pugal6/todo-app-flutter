import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo_home.dart';
import 'package:todo_app/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {

  
  @override
  State createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

 

  @override
  Widget build(BuildContext context) {
  final provider = context.watch<TodoProvider>();

    return ListView.builder(
      itemCount: provider.todos.length,

      itemBuilder: (context, index) {
          final todo = provider.getTodo(index);
          return ListTile(
            title: Text(todo.title ?? "Fallback"),
            subtitle: Text(todo.message),
          );
      }
    );
  }
}