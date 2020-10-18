import 'package:flutter/material.dart';
import 'package:qaphelaMobile/shared/widgets/case-edittext.dart';
import 'package:qaphelaMobile/shared/widgets/utils.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  Map<String, String> fetchMe = {
    "lon": "",
    "lat": "",
    "phoneNumber": "",
    "name": ""
  };

  final _formKey = GlobalKey<FormState>();

  Function handleInput() {
    // setState((value) {
    //                   fetchMe['name'] = value;
    //                 }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          title: Text(
            "Schedule FetchMe",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: MediaQuery.of(context).size.width * 0.08,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new),
              iconSize: 36.0,
              color: Colors.black,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
        extendBodyBehindAppBar: false,
        body: Container(
            padding: EdgeInsets.fromLTRB(4, 36, 4, 2),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                  0.2,
                  0.4,
                  0.6,
                  0.8,
                ],
                    colors: [
                  Colors.yellow[50],
                  Colors.lightGreen[50],
                  Colors.yellow[50],
                  Colors.lightGreen[50],
                ])),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CaseEditText(
                      title: 'Name',
                      text: 'Enter your full name',
                      onChange: handleInput),
                  CaseEditText(
                      title: 'Contact Number',
                      text: 'Enter your cell phone number',
                      onChange: handleInput),
                  CaseEditText(
                      title: 'FetchMe Date',
                      text: 'Enter the date you want to be fetched on',
                      onChange: handleInput),
                  CaseEditText(
                      title: 'FetchMe Time',
                      text: 'Enter the time you want to be fetched at',
                      onChange: handleInput),
                  CaseEditText(
                      title: 'Note',
                      text: 'Enter other information relevant',
                      onChange: handleInput),
                  Material(
                    elevation: 5,
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12.0),
                    child: MaterialButton(
                      onPressed: () {
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Data is in processing.')));
                          }
                        },
                      minWidth: 200.0,
                      height: 8.0,
                      child: Text(
                        "Schedule FetchMe",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ),
                  ),
                  
                ],
              ),
            )));
  }
}
