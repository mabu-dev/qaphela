import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/views/details-entry.dart';

class CaseDetails extends StatefulWidget {
  final CheckCase checkCase;
  CaseDetails({
    Key key,
    this.checkCase,
  }) : super(key: key);

  @override
  _CaseDetailsState createState() => _CaseDetailsState();
}

class _CaseDetailsState extends State<CaseDetails> {
  CheckCase editCheckCase;
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: MediaQuery.of(context).size.width * 0.08,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(edit == false ? Icons.edit : Icons.cancel),
              iconSize: MediaQuery.of(context).size.width * 0.08,
              color: Colors.white,
              onPressed: () {
                // setState(() {
                //   edit = !edit;
                // });
                edit == false
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Alert Message"),
                            // Retrieve the text which the user has entered by
                            // using the TextEditingController.
                            content: Text(
                                'Are you sure you want to edit this case?'),
                            actions: <Widget>[
                              new FlatButton(
                                  child: new Text('Yes'),
                                  onPressed: () {
                                    setState(() {
                                      edit = !edit;
                                    });
                                    Navigator.of(context).pop();
                                  }),
                              new FlatButton(
                                child: new Text('NO'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      )
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Alert Message"),
                            // Retrieve the text which the user has entered by
                            // using the TextEditingController.
                            content: Text(
                                'You will lose all changes you have made, do you want to continue?'),
                            actions: <Widget>[
                              new FlatButton(
                                  child: new Text('Yes'),
                                  onPressed: () {
                                    setState(() {
                                      edit = !edit;
                                    });
                                    Navigator.of(context).pop();
                                  }),
                              new FlatButton(
                                child: new Text('NO'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );
                // Navigator.pop(context);
                // sprint('');
              },
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent,
          title: Text(
            widget.checkCase.title,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(4, 12, 4, 0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                    Text(
                      widget.checkCase.title,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    CaseDetailsEntry(
                      text: widget.checkCase.policeCaseNumber,
                      title: "Police CaseNumber",
                      edit: edit,
                      editable: false,
                    ),
                    CaseDetailsEntry(
                      text: widget.checkCase.caseStatus,
                      title: "Case Status",
                      edit: edit,
                      editable: false,
                    ),
                    CaseDetailsEntry(
                      text: widget.checkCase.frequency.toString(),
                      title: "Frequency",
                      edit: edit,
                      editable: false,
                    ),
                    CaseDetailsEntry(
                      text: widget.checkCase.when,
                      title: "Reported On",
                      edit: edit,
                      editable: false,
                    ),
                    CaseDetailsEntry(
                      text: widget.checkCase.reportType,
                      title: "Report Type",
                      edit: edit,
                      editable: false,
                    ),
                    CaseDetailsEntry(
                        text: widget.checkCase.preview,
                        title: "Preview",
                        edit: edit),
                    Padding(padding: EdgeInsets.only(bottom: 4)),
                    Material(
                      elevation: 5,
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(12.0),
                      child: edit == true
                          ? MaterialButton(
                              onPressed: () {
                                //                  Navigator.push(
                                //                    context,
                                //                    MaterialPageRoute(builder: (context) => MyLoginPage()),
                                //                  );
                              },
                              minWidth: 200.0,
                              height: 8.0,
                              child: Text(
                                "Update Case",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                            )
                          : null,
                    )
                  ]))
            ],
          ),
        ));
  }
}
