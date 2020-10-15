import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/net/api.dart';
import 'case-details.dart';

class CaseCheckScreen extends StatefulWidget {
  @override
  _CaseCheckScreen createState() => _CaseCheckScreen();
}

class _CaseCheckScreen extends State<CaseCheckScreen> {
  String searchString;
  List<CheckCase> cases = [];
  MyApi api = MyApi();

  void setCases() async {
    List<CheckCase> returnCases = await api.getCases();
    setState(() {
      cases = returnCases;
    });
  }

  Widget _entryField(
      String title, String id, String hint, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                  onChanged: (value) => {
                        setState(() {
                          searchString = value;
                        }),
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
            onPressed: () => setCases(),
          ),
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
        title: _entryField("Search", 'search', 'Search case by name', context),
      ),
      body: ListView.builder(
        itemCount: cases.length,
        itemBuilder: (BuildContext listContext, int index) {
          return cases.length != 0
              ? ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return CaseDetails(checkCase: cases[index]);
                        },
                      ),
                    );
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
        },
      ),
    );
  }
}
