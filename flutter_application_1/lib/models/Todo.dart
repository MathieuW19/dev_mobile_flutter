import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final Function delete;
  final Elements elmt;
  Todo({this.elmt, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(this.elmt.title),
        subtitle: Text(this.elmt.content),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: this.delete,
        ),
      ),
    );
  }
}

class Elements {
  final String title;
  final String content;
  bool done;
  Elements({this.title, this.content});
}
