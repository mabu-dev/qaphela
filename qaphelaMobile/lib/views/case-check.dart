import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:http/http.dart' as http;

import 'case-details.dart';

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
    List<dynamic> stringList = json.decode(res.body);
    //  List<CheckCase>  r = stringList.map((i) => CheckCase.fromJson(i)).toList();

    return stringList.map((i) => CheckCase.fromJson(i)).toList();
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
            itemCount: cases.length,
            itemBuilder: (BuildContext listContext, int index) {
              return cases.length != 0
                  ? ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return CaseDetails(checkCase: cases[index]);
                        }));

                      },
                      trailing: Text(
                        cases[index].when,
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(cases[index].title))
                  : ListTile(
                      onTap: () {
                        print('clicked Case number $index');
                      },
                      leading: Icon(Icons.list),
                      trailing: Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("Case List is empty "));
            })
        );
  }


}
