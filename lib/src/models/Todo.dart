import 'dart:collection';

import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  List<String> _uncompletedTodos = <String>[];

  UnmodifiableListView<String> get uncompletedTodos => UnmodifiableListView(_uncompletedTodos);

  void createTodo(String title) {
    _uncompletedTodos.add(title);

    notifyListeners();
  }

  void completeTodo(int index) {
    _uncompletedTodos.removeAt(index);

    notifyListeners();
  }
}