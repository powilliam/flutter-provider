import 'package:HandlingState/src/screens/CreateTodo.dart';
import 'package:flutter/material.dart';
import 'package:HandlingState/src/screens/home.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Handling State",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.redAccent
        ),
        scaffoldBackgroundColor: Colors.grey[850],
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
        ),
        fontFamily: "OpenSans",
      ),        
      routes: <String, WidgetBuilder> {
        '/create-todo': (BuildContext context) => CreateTodo(),
      },
      home: Home()
    );
  }
}