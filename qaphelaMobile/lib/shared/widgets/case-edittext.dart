import 'package:flutter/material.dart';

class CaseEditText extends StatelessWidget {
  final TextInputType inputType;
  final String title, text;
  final bool editable;
  final Function onChange;
  const CaseEditText({
    Key key,
    this.editable,
    this.title,
    this.text,
    this.onChange,
    this.inputType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // id:id,
      keyboardType: inputType,
      key: key,
        enabled: editable,
        minLines: 1,
        maxLines: 10,
        // controller: TextEditingController(text: text),
        onChanged: (value) => onChange(key,value),
        decoration: InputDecoration(
          // id: id,
            labelText: title,
            border: OutlineInputBorder(),
            fillColor: Color(0xfff3f3f4),
            filled: true));
  }
}
