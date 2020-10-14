import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:http/http.dart' as http;
import 'package:qaphelaMobile/model/perpetrator.dart';
import 'package:qaphelaMobile/views/perpetrator-details.dart';

import 'case-details.dart';

class CaseCheckScreen extends StatefulWidget {
  @override
  _CaseCheckScreen createState() => _CaseCheckScreen();
}

Future<List<Perpetrators>> doStuff() async {
  Map<String, String> _setHeaders() => <String, String>{
        'Accept': 'application/json',
      };
  http.Response res = await http.get('http://192.168.8.106:8000/api/abusers/',
      headers: _setHeaders());

  if (res.body != null) {
    List<dynamic> stringList = json.decode(res.body);
    //  List<CheckCase>  r = stringList.map((i) => CheckCase.fromJson(i)).toList();

    return stringList.map((i) => Perpetrators.fromJson(i)).toList();
  } else {
    throw new Exception(res);
  }
  // return CheckCase.;
}

class _CaseCheckScreen extends State<CaseCheckScreen> {
  String searcString;
  List<Perpetrators> cases = [];

  void setCases() async {
    List<Perpetrators> returnCases = await doStuff();

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
              "Search", 'search', 'search abuser by name o Image', context),
        ),
        body: ListView.builder(
            itemCount: cases.length,
            itemBuilder: (BuildContext listContext, int index) {
              return cases.length != 0
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return PerpetratorDetails(
                              fullNames: cases[index].fullNames,
                            );
                          }));
                        },
                        leading: cases[index].imageurl != null
                            ? Image.network(cases[index].imageurl)
                            : Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 30,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                        title: Text(cases[index].fullNames),
                        subtitle: Text(
                          cases[index].workplaceDetails,
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                        isThreeLine: true,
                      ),
                      
                    )
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
            }));
  }
}
