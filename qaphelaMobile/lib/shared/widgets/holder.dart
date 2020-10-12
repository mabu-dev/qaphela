import 'package:flutter/material.dart';

class CustomBody extends StatefulWidget {
  CustomBody(this.child);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _CustomBody();
}

class _CustomBody extends State<CustomBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(45.0))),
              child: widget.child,
            )
          ]);
  }
}
