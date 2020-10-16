import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/model/perpetrator.dart';
import 'package:qaphelaMobile/net/api.dart';
import 'package:qaphelaMobile/views/perpetrator-details.dart';

class CaseCheckScreen extends StatefulWidget {
  @override
  _CaseCheckScreen createState() => _CaseCheckScreen();
}

class _CaseCheckScreen extends State<CaseCheckScreen> {
  String searchString;
  List<Perpetrators> cases = [];
  List<CheckCase> response;
  MyApi api = MyApi();

  setCases() async {
    List<Perpetrators> returnCases = await api.getAbusers();
    setState(() {
      cases = returnCases;
    });
  }

  @override
  void initState() {
    super.initState();
    setCases();
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
            onPressed: () async => {
              response = await api.getAbuser(searchString),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return PerpetratorDetails(
                      fullNames: response[0].perpetrators.fullNames,
                    );
                  },
                ),
              )
            },
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
          title: _entryField(
              "Search", 'search', 'search abuser by name or image', context),
        ),
        body: ListView.builder(
            itemCount: cases.length,
            itemBuilder: (BuildContext listContext, int index) {
              return cases.length != 0
                  ? Card(
                      elevation: 4,
                      shadowColor: Colors.orangeAccent[100],
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return PerpetratorDetails(
                              fullNames: cases[index].fullNames,
                            );
                          }));
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SizedBox(
                                height: 52,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      cases[index].imageurl != null
                                          ? Image.network(cases[index].imageurl)
                                          : Icon(
                                              Icons.person,
                                              color: Colors.orangeAccent,
                                              size: 50,
                                              semanticLabel:
                                                  'Text to announce in accessibility modes',
                                            ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 2.0)),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              cases[index].fullNames,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 1.0)),
                                            Text(
                                              cases[index].workplaceDetails,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]))),
                      ))
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

/*
Card(
            elevation: 4,
            shadowColor: Colors.orangeAccent[100],
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child:SizedBox(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                      ),
                    ),
                    ListTile(
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
                      )

                  ]
                  ))))
*/
