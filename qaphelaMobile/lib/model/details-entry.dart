import 'package:flutter/material.dart';

class CaseDetailsEntry extends StatelessWidget {
  final String text, title;
  const CaseDetailsEntry({Key key, this.text, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-1.0, -1.0),
      margin: EdgeInsets.only(top:12.0),
      // decoration: BoxDecoration(
      //   border: Border(
      //       bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
      //     ),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.black45, fontWeight: FontWeight.w400)
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          )
      ]),
    );
  }
}