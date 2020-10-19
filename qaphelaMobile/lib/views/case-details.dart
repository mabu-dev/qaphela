import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/net/api.dart';
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
  MyApi api = MyApi();

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
                          content:
                              Text('Are you sure you want to edit this case?'),
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
            Container(
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Card(
                      color: Colors.green[50],
                      elevation: 4,
                      shadowColor: Colors.orangeAccent[100],
                      child: SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width * 0.45,
                          // child: Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text("Complainant",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.orange,
                                      )),
                                  Row(
                                    children: [
                                      widget.checkCase.reporter.imageurl != null
                                          ? Image.network(widget
                                              .checkCase.reporter.imageurl)
                                          : Icon(
                                              Icons.person,
                                              color: Colors.orangeAccent,
                                              size: 50,
                                              semanticLabel:
                                                  'Text to announce in accessibility modes',
                                            ),
                                      Column(children: [
                                        Text(widget
                                            .checkCase.reporter.user.firstName),
                                        Text(widget
                                            .checkCase.reporter.user.lastName),
                                      ])
                                    ],
                                  ),
                                ],
                              )))),
                  Padding(padding: EdgeInsets.only(right: 1)),
                  Card(
                    color: Colors.green[50],
                    elevation: 4,
                    shadowColor: Colors.orangeAccent[100],
                    child: SizedBox(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.45,
                      // child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            // Text("Contacts",
                            //     style: const TextStyle(
                            //       fontSize: 18.0,
                            //       fontWeight: FontWeight.w200,
                            //       color: Colors.orange,
                            //     )),
                            Padding(padding: EdgeInsets.only(bottom: 2)),
                            Text(
                                widget.checkCase.reporter.socialProfiles != null
                                    ? widget
                                        .checkCase.reporter.socialProfiles.name
                                    : 'N/A',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black45,
                                )),
                            Text(
                                widget.checkCase.reporter.socialProfiles != null
                                    ? widget.checkCase.reporter.socialProfiles
                                        .profilePage
                                    : 'N/A',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black45,
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 1)),
                            Text(widget.checkCase.reporter.contactDetails
                                .primaryContactNumber),
                          ],
                        ),
                      ),
                    ),
                  )
                ])),
            SingleChildScrollView(
              child: Form(
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
                              api.updateCase(widget.checkCase);
                            },
                            minWidth: 200.0,
                            height: 8.0,
                            child: Text(
                              "Update Case",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12.0),
                            ),
                          )
                        : null,
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
