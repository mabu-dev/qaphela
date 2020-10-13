import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/model/details-entry.dart';

class CaseDetails extends StatelessWidget {
  final CheckCase checkCase;
  CaseDetails({
    Key key,
    this.checkCase,
  }) : super(key: key);

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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.greenAccent,
          title: Text(
            checkCase.title,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(4,12,4,0),
          color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            children: [
            
            Flexible(
            flex: 1, 
            fit: FlexFit.loose, 
            child: Column(children:<Widget>[
              Text(
            checkCase.title,
            style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400),
          ),
              CaseDetailsEntry(text: checkCase.policeCaseNumber, title: "Police CaseNumber",),
              CaseDetailsEntry(text: checkCase.caseStatus, title: "Case Status",),
              CaseDetailsEntry(text: checkCase.frequency.toString(), title: "Frequency",),
              CaseDetailsEntry(text: checkCase.when, title: "Reported On",),
              CaseDetailsEntry(text: checkCase.reportType, title: "Report Type",),
              CaseDetailsEntry(text: checkCase.preview, title: "Preview",),

          
            ])
          )
          ],),
        )
    );
  }
}
