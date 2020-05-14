import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:HandlingState/src/models/Todo.dart';

class CreateTodo extends StatefulWidget {

  @override
  _CreateTodo createState() => _CreateTodo();
}

class _CreateTodo extends State<CreateTodo> {
  String _title;

  void _handleChangeTitle(String value) {
    setState(() {
      _title = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        elevation: 1,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: Colors.grey[300]),
              ),
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white), 
              onChanged: _handleChangeTitle,
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 25),
              child: Consumer<TodoModel>(
                builder: (context, todo, child) {
                  return RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_title.length > 0) {
                        todo.createTodo(_title);
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Create"),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}