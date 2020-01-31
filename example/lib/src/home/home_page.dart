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
                  // Execute this function when the form is validated.
                  print(date);
                },
                validator: ((date) {
                  // Executed to validate the date, true if is validated and false if no.
                  return true;
                }),
                labelFail: "Invalid date", // The error that will be show
                decoration: InputDecoration(), // Decoration to the widget
                showDatePicker: true,
                dateFormat:
                    'yyyy-dd-mm', // Date format to the mask, 'yyyy' is the year, 'dd' is the day and 'mm' is the month
                initialDate: null, // Initial date
                firstDate: DateTime(
                    1900), // First Date to the showPicker if is enabled
                lastDate:
                    DateTime(2100), // Last Date to the showPicker if is enabled
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
