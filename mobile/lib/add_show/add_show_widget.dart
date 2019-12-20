import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:show_feeder/models/title_info.dart';

import "../models/data.dart";

class AddShow extends StatelessWidget {

  AddShow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.0, 70.0, 50.0, 0.0),
      child: AddShowForm()
    );
  }
}

class AddShowForm extends StatefulWidget {
  @override
  AddShowFormState createState() {
    return AddShowFormState();
  }
}

class AddShowFormState extends State<AddShowForm> {

  final _formKey = GlobalKey<FormState>();
  final _showTitle = TextEditingController();
  final _showDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _showTitle,
              decoration: const InputDecoration(
                icon: const Icon(Icons.text_fields),
                labelText: "Enter Show Title"
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _showDate,
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                labelText: "Enter Date mm/dd/yy"
              ),
              validator: (value) {
                // NOTE: The year automatically assumes 21st century
                final regex = RegExp(r"^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/\d{2}$");
                return regex.hasMatch(value) ? null : "Please enter a valid date mm/dd/yy";
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Adding Show...")));

                    // date is in format mm/dd/yy
                    String date = _showDate.text;

                    // Parse the date
                    int noMonth = int.parse(date.substring(0, 2)); // mm
                    int noDay = int.parse(date.substring(3, 5)); // dd
                    int noYear = 2000 + int.parse(date.substring(6, 8)); // yy
                    String monthName = intToMonth[noMonth];
                    var info = new TitleInfo(title: _showTitle.text, day: noDay, month: monthName, year: noYear);

                    // Add Show to Home list
                    Provider.of<Data>(context, listen: true).handleAddShow(info);
                  }
                },
                child: Text("Add to Home List"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: RaisedButton(
                onPressed: () {
                  if (_showTitle.text.length != 0) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Adding to Favorites...")));

                    // Add Show to Favorites list
                    // TODO: Implement this method using Future<List<String>>
                    // Provider.of<Data>(context, listen: true).handleAddFavorite(_showTitle.text);
                  }
                },
                child: Text("Add to Favorites")
              )
            )
          ]
        )
      )
    );
  }
}
