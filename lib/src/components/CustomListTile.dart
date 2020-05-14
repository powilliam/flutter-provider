import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key, 
    this.title,
    @required this.onPressed
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white)),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.timer, color: Colors.white, size: 18),
      ),
      trailing: FlatButton(
        child: Text("DONE"), 
        onPressed: onPressed,
        textColor: Colors.white,
      ),
    );
  }
}