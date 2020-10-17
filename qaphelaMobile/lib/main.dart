import 'package:flutter/material.dart';
import 'package:qaphelaMobile/views/case-check.dart';
import 'package:qaphelaMobile/views/landing.dart';
import 'package:qaphelaMobile/views/login.dart';
import 'package:qaphelaMobile/views/menu-page.dart';
import 'package:qaphelaMobile/views/welcome-screen.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  '/login': (context) => Login(),
  '/': (context) => WelcomeScreen(),
  '/fetchMe': (context) => LandingScreen(),
  '/menu': (context) => MenuScreen(),
  '/caseCheck': (context) => CaseCheckScreen(),
  '/caseDetails': (context) => CaseCheckScreen(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qaphela',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.green[300],
        fontFamily: 'Cabin',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Login(),
      initialRoute: '/',
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalStorage storage = new LocalStorage('qaphelaMobile');

  String getFirstUse() {
    Map<String, dynamic> token = this.storage.getItem('firstUse');
    return token['firstUse'];
  }

  @override
  void initState() {
    getFirstUse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // colors: [const Color(0xffee0000), const Color(0xffeeee00)],
            tileMode: TileMode.repeated,
            colors: [Colors.blue[50], Colors.greenAccent[100]],
            stops: [0.1, 0.8],
          ),
        ),
        child: WelcomeScreen(),
      ),
    );
  }
}
