import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';

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
          color: Colors.white,
          child: Text(
            checkCase.preview,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        )
    );
  }
}
