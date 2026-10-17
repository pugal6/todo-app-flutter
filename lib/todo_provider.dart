import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

class TodoProvider extends ChangeNotifier {

  List<Todo> todos = [];

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  Todo getTodo(int index) {
    return todos[index];
  }
}