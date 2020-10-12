import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:http/http.dart' as http;

class CaseCheckScreen extends StatefulWidget {
  @override
  _CaseCheckScreen createState() => _CaseCheckScreen();
}

Future<List<CheckCase>> doStuff() async {
  Map<String, String> _setHeaders() => <String, String>{
        'Accept': 'application/json',
      };
  http.Response res = await http.get('http://192.168.8.106:8000/api/cases/',
      headers: _setHeaders());

  if (res.body != null) {
    List<CheckCase> stringList = jsonDecode(res.body);
    return stringList;
  } else {
    throw new Exception(res);
  }
  // return CheckCase.;
}

class _CaseCheckScreen extends State<CaseCheckScreen> {
  String searcString;
  List<CheckCase> cases = [];
  void setCases() async {
    List<CheckCase> returnCases = await doStuff();

    print('setCases returnCases: ${returnCases.toString()}');
    setState(() {
      cases = returnCases;
    });
  }

  Widget _entryField(
      String title, String id, String hint, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 10),
      // height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                  onChanged: (value) => {
                        setState(() {
                          searcString = value;
                        }),
                        // print('TextField onChanged: ${auth.toString()}'),
                      },
                  decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true))),
          IconButton(
              icon: Icon(Icons.search),
              iconSize: MediaQuery.of(context).size.width * 0.08,
              color: Colors.orangeAccent,
              onPressed: () => setCases()),
        ],
      ),
    );
  }

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
          title: _entryField(
              "Search", 'search', 'search case by name or id', context),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Icon(Icons.list),
                  trailing: Text(
                    "GFG",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("Case number $index"));
            })
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // )
        );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
