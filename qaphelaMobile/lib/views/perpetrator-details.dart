import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/net/api.dart';
import 'package:qaphelaMobile/shared/widgets/PerpetratorEntry.dart';

class PerpetratorDetails extends StatefulWidget {
  final String fullNames;
  PerpetratorDetails({Key key, this.fullNames}) : super(key: key);

  @override
  _PerpetratorDetailsState createState() => _PerpetratorDetailsState();
}

class _PerpetratorDetailsState extends State<PerpetratorDetails> {

  String searchString;
  List<CheckCase> per;
  MyApi api = MyApi();

  setCases() async {
    List<CheckCase> returnCases = await api.getAbuser(widget.fullNames);
    setState(() {
      per = returnCases;
    });
  }

  @override
  void initState() {
    super.initState();
    setCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.orangeAccent,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text((widget.fullNames != null ? widget.fullNames : null),
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              background: Icon(
                Icons.person,
                color: Colors.black45,
                size: 80,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.person_add_alt),
            //     iconSize: 30.0,
            //     color: Colors.white,
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          )
        ];
      },
      body: per != null ? Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.2,
              0.8,
            ],
                colors: [
              Colors.yellow[50],
              Colors.lightGreen[50],
            ])),
        padding: EdgeInsets.fromLTRB(2, 16, 0, 0),
        // color: Colors.white,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Card(
                color: Colors.green[50],
                elevation: 4,
                shadowColor: Colors.orangeAccent[100],
                child: SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.47,
                    // child: Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Complainant",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.orange,
                                )),
                            Row(
                              children: [
                                per[0].reporter.imageurl != null
                                    ? Image.network(per[0].reporter.imageurl)
                                    : Icon(
                                        Icons.person,
                                        color: Colors.orangeAccent,
                                        size: 50,
                                        semanticLabel:
                                            'Text to announce in accessibility modes',
                                      ),
                                Column(children: [
                                  Text(per[0].reporter.user.firstName),
                                  Text(per[0].reporter.user.lastName),
                                ])
                              ],
                            ),
                          ],
                        )))),
            Padding(padding: EdgeInsets.only(right: 1)),
            Card(
                color: Colors.green[50],
                elevation: 4,
                shadowColor: Colors.orangeAccent[100],
                child: SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.47,
                    // child: Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            // Text("Contacts",
                            //     style: const TextStyle(
                            //       fontSize: 18.0,
                            //       fontWeight: FontWeight.w200,
                            //       color: Colors.orange,
                            //     )),
                            Padding(padding: EdgeInsets.only(bottom: 2)),
                            Text(per[0].reporter.socialProfiles.name,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black45,
                                )),
                            Text(per[0].reporter.socialProfiles.profilePage,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black45,
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 1)),
                            Text(per[0]
                                .reporter
                                .contactDetails
                                .primaryContactNumber),
                          ],
                        ),),),)
          ]),
          ListView.builder(
              shrinkWrap: true,
              itemCount: per.length,
              itemBuilder: (BuildContext listContext, int index) {
                return PerpetratorEntry(checkCase: per[index]);
              })
        ]),
      ): Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.greenAccent,
          strokeWidth: 2,
        ),
      ),
    ));
  }
}

/*

 

==========


*/
