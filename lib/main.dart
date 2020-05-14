import 'package:flutter/material.dart';
import 'package:HandlingState/src/app.dart';
import 'package:provider/provider.dart';
import 'package:HandlingState/src/models/Todo.dart';

void main() {
  runApp(
    ListenableProvider(
      create: (BuildContext context) => TodoModel(),
      child: MyApp(),
    )
  );
}