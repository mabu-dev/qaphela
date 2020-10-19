import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBlinkingButton extends StatefulWidget {
    @override
    _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
  }

  class _MyBlinkingButtonState extends State<MyBlinkingButton>
      with SingleTickerProviderStateMixin {
    AnimationController _animationController;

    @override
    void initState() {
      _animationController =
          new AnimationController(vsync: this, duration: Duration(seconds: 1));
      _animationController.repeat(reverse: true);
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return FadeTransition(
        opacity: _animationController,
        child: MaterialButton(
          onPressed: () => null,
          child: Text("Now"),
          color: Colors.orangeAccent,
        ),
      );
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }
  }