import 'package:date_text_masked/date_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DateTextFormField(
                onValidate: (date) {
                  print(date);
                },
                validator: ((date) {
                  return true;
                }),
              ),
              RaisedButton(
                onPressed: () {
                  formKey.currentState.validate();
                },
                child: Text('Get Date'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
