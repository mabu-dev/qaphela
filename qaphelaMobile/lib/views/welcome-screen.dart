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
          padding: EdgeInsets.only(top: 45.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 72,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.greenAccent,
                    size: 72,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),
              Expanded(
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          // width: MediaQuery.of(context).size.width,
                          // height: 500,
                          margin: EdgeInsets.only(top: 36),
                          padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 4.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45.0),
                                  topRight: Radius.circular(45.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // decoration: BoxDecoration(
                            //     // color: Colors.white,
                            //     borderRadius: BorderRadius.all(
                            //         Radius.circular(45.0))),
                            children: [
                              Text(item['header'],
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orangeAccent,
                                    // height: 2.0
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 12)),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    item['description'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.2,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ))))
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
        color: Colors.orangeAccent[100],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                  color: Colors.white,
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
        label: currentPage != 4
            ? Text('Skip',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ))
            : Text('Login',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                )),
      ),
    );
  }
}

/*

 Expanded(
                      child: new Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.7,
                            padding: EdgeInsets.fromLTRB(2.0, 45.0, 2.0, 4.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45.0),
                                    topRight: Radius.circular(45.0))),
                            child:Expanded(
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                                    item['description'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 1.2,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                      )
                      )
                            
                            )))

*/
