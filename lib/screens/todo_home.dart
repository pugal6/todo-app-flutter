
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/todo_list.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_provider.dart';

class _HomeState extends State<Home> {
   
     @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo App"
          )
        ),

        body: Column(
          children: [
            CreateTodoForm(),
            Expanded(child:  TodoList() )        
             ],
        )
      );
      
    } 
}



class Home extends StatefulWidget {


   @override
   State createState() => _HomeState();

 

}

class CreateTodoForm extends StatefulWidget {

  const CreateTodoForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateTodoFormState();
  }

}
class _CreateTodoFormState extends State{

  

  final idController = TextEditingController();
  final titleController = TextEditingController();
  final messageController = TextEditingController();


  void createTodoMethod() {
    int id = int.parse(idController.text);
    String title = titleController.text;
    String message = messageController.text;

     Todo todo = Todo(id, title, message);
     context.read<TodoProvider>().addTodo(todo);
     
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Enter the id: "),
        SizedBox(
          width: 100,
          child: TextField(controller: idController,
          decoration: InputDecoration(border: OutlineInputBorder(),
          ),
          
          ),
          
        ),

        SizedBox(height: 10,),

        Text("Enter the title"),
        SizedBox(
          width: 100,
          child: TextField(
            controller: titleController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          
        ),

        SizedBox(height: 10,),

           Text("Enter the message"),
        SizedBox(
          width: 100,
          child: TextField(
            controller: messageController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          
        ),

        ElevatedButton(onPressed: createTodoMethod, child: Text("Submit",),)
      ],
    );

  
    
  }
}


