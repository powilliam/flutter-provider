import 'package:HandlingState/src/components/CustomListTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:HandlingState/src/models/Todo.dart';

class Home extends StatefulWidget {

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {


  void _renderSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Ok, removing it right now"),
        duration: Duration(seconds: 2),
      )
    );
  }

  void _navigateToCreateTodo() {
    Navigator.pushNamed(context, '/create-todo');
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My list", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5,
        onPressed: _navigateToCreateTodo
      ),
      body: Consumer<TodoModel>(
        builder: (context, todo, child) {
          if (todo.uncompletedTodos.length == 0) {
            return Center(
              child: Text(
                "Create a to'do and it will appear here",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10, bottom: 100),
              itemCount: todo.uncompletedTodos.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTile(
                  title: todo.uncompletedTodos[index],
                  onPressed: () {
                    todo.completeTodo(index);
                    _renderSnackBar();
                  },
                );
              },
              separatorBuilder: (BuildContext context,int index) => Divider(color: Colors.grey[800]),
            );
          }
        },
      )
    );
  }
}