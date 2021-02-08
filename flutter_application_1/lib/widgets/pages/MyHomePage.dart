import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Todo.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  List<Elements> elements = [];
  List<bool> done;
  @override
  void initState() {
    super.initState();
    done = List<bool>.filled(elements.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOLIST"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: elements.length,
                itemBuilder: (context, i) {
                  final element = elements[i];
                  return Todo(
                    elmt: element,
                    delete: () {
                      setState(() {
                        elements.removeAt(i);
                      });
                    },
                  );
                },
                shrinkWrap: true,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(context),
          tooltip: 'Ajouter une tâche',
          backgroundColor: Colors.red,
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      Elements elmt = new Elements(
          title: titleController.text, content: contentController.text);
      elements.add(elmt);
    });
    titleController.clear();
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ajouter une tâche à votre liste'),
            content: TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Saisir la tâche'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ajouter'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(titleController.text);
                },
              ),
              FlatButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
