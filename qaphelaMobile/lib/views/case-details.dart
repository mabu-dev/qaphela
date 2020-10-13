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
              icon: Icon(Icons.edit),
              iconSize: MediaQuery.of(context).size.width * 0.08,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  edit = !edit;
                });
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
          child: SingleChildScrollView(
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
                        edit: edit),
                    CaseDetailsEntry(
                        text: widget.checkCase.caseStatus,
                        title: "Case Status",
                        edit: edit),
                    CaseDetailsEntry(
                        text: widget.checkCase.frequency.toString(),
                        title: "Frequency",
                        edit: edit),
                    CaseDetailsEntry(
                        text: widget.checkCase.when,
                        title: "Reported On",
                        edit: edit),
                    CaseDetailsEntry(
                        text: widget.checkCase.reportType,
                        title: "Report Type",
                        edit: edit),
                    CaseDetailsEntry(
                        text: widget.checkCase.preview,
                        title: "Preview",
                        edit: edit),
                    
                  ]
                  )
              ),
        ));
  }
}
