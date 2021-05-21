import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodoView extends StatefulWidget {
  Todo todo;
  TodoView({Key key, this.todo}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState(todo: this.todo);
}

class _TodoViewState extends State<TodoView> {
  Todo todo;
  _TodoViewState({this.todo});
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (todo != null) {
      titleController.text = todo.title;
      descriptionController.text = todo.description;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Todo View"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                  child: colorOverride(TextField(
                onChanged: (data) {
                  todo.title = data;
                },
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Title",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                  //fillColor: Colors.green
                ),
                controller: titleController,
              ))),
              SizedBox(
                height: 25,
              ),
              Container(
                  child: colorOverride(TextField(
                maxLines: 5,
                onChanged: (data) {
                  todo.description = data;
                },
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Description",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                  //fillColor: Colors.green
                ),
                controller: descriptionController,
              ))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("Alert"),
                              content: Text(
                                  "Mark this todo as ${todo.status ? 'not done' : 'done'}  "),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("No"),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      todo.status = !todo.status;
                                    });
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("Yes"),
                                )
                              ],
                            ));
                  },
                  child: Text(
                    "${todo.status ? 'Mark as Not Done' : 'Mark as Done'} ",
                    style: TextStyle(color: Colors.white),
                  )),
              VerticalDivider(
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.save, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, todo);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget colorOverride(Widget child) {
    return new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        hintColor: Colors.white,
      ),
      child: child,
    );
  }
}
