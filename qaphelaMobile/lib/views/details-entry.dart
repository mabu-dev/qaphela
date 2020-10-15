import 'package:flutter/material.dart';
import 'package:qaphelaMobile/shared/widgets/case-edittext.dart';

class CaseDetailsEntry extends StatelessWidget {
  final String text, title;
  final bool edit, editable;
  const CaseDetailsEntry(
      {Key key, this.text, this.title, this.edit, this.editable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-1.0, -1.0),
      margin: EdgeInsets.only(top: 12.0),
      // decoration: BoxDecoration(
      //   border: Border(
      //       bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
      //     ),),
      child: edit == false
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w400)),
                  Text(
                    text,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )
                  // edit == true?:
                ])
          : CaseEditText(
            editable: editable, title: title, text:text, onChange: (val)=>print('CaseEditText $title:- $val '),
          ),
                  
    );
  }
}

/*

TextField(
              enabled: editable,
              minLines: 1,
              maxLines: 10,
              controller: TextEditingController(text: text),
              onChanged: (value) => {
                    // setState(() {
                    //   auth[id] = value;
                    // }),
                    print('TextField onChanged: $text'),
                  },
                  
              // obscureText: isPassword,
              decoration: InputDecoration(
                  // hintText: hint,
                  labelText: title,
                  border: OutlineInputBorder(),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))

*/
