import 'package:flutter/material.dart';

class CaseDetailsEntry extends StatelessWidget {
  final String text, title;
  final bool edit;
  const CaseDetailsEntry({Key key, this.text, this.title, this.edit}) : super(key: key);

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
          edit == true?Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ):TextField(
            controller: TextEditingController(text:text),
              onChanged: (value) => {
                    // setState(() {
                    //   auth[id] = value;
                    // }),
                    print('TextField onChanged: $text'),
                  },
              // obscureText: isPassword,
              decoration: InputDecoration(
                  // hintText: hint,
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
      ]),
    );
  }
}