import 'package:flutter/material.dart';
import 'package:qaphelaMobile/utils/items.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map((item) => Container(
          color: Colors.orangeAccent[100],
          padding: EdgeInsets.only(top: 36.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                // fit: FlexFit.tight,
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 150,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                // child: Image.asset(
                //   item['image'],
                //   fit: BoxFit.fitWidth,
                //   width: 220.0,
                //   alignment: Alignment.bottomCenter,
                // ),
              ),
              Text(item['header'],
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF3F3D56),
                      height: 2.0)),
              new Expanded(
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(45.0))),
                        child: Text(
                          item['description'],
                          style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 1.2,
                              fontSize: 16.0,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      )))
            ],
          )))
      .toList();

  double currentPage = 0.0;
  final _pageViewController = new PageController();
  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0XFF256075)
                    : Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                return slides[index];
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white30,
                  margin: EdgeInsets.only(top: 50.0),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        label: Text('Skip'),
      ),
    );
  }
}
