import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/model/perpetrator.dart';
import 'package:qaphelaMobile/net/api.dart';
import 'package:qaphelaMobile/shared/widgets/utils.dart';
import 'package:qaphelaMobile/views/perpetrator-details.dart';

class CaseCheckScreen extends StatefulWidget {
  CaseCheckScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CaseCheckScreen createState() => _CaseCheckScreen();
}

class _CaseCheckScreen extends State<CaseCheckScreen>
    with SingleTickerProviderStateMixin {
  String searchString;
  List<Perpetrators> cases;
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

  String value = "";

  TextEditingController _textEditingController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = new TabController(
  //     initialIndex: 1,
  //     length: 4,
  //     vsync: this,
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScroled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.black,
              centerTitle: false,
              // brightness: Brightness.dark,
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.blue),
                backgroundColor: Colors.orange[50],
                brightness: Brightness.dark,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  collapseMode: CollapseMode.pin,
                  title: Text(
                    'Perpetrators',
                    //$ can get data and use it !
                    style: headerTextStyle,
                  ),
                  // title: Text((widget.fullNames != null ? widget.fullNames : null),
                  // style: TextStyle(color: Colors.black, fontSize: 16)),
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // SizedBox(
                      //   height: smallSeparateSize,
                      // ),SizedBox(
                      //   height: smallSeparateSize,
                      // ),
                      // Row(
                      //   children: <Widget>[
                      //     IconButton(
                      //       icon: Icon(
                      //         Icons.keyboard_arrow_left,
                      //         color: Colors.black,
                      //         size: 37,
                      //       ),
                      //       onPressed: () {
                      //         Navigator.of(context).pop();
                      //       },
                      //     ),
                      //     Spacer(),
                      //     IconButton(
                      //       icon: new Icon(
                      //         const IconData(0xe900, fontFamily: 'Menu Dot'),
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: smallSeparateSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                controller: _textEditingController,
                                onSubmitted: (text) {
                                  value = text;

                                  //_textEditingController.addListener(() {
                                  //it adds value to listener when doing certain action
                                  // });

                                  print(_textEditingController.text);

                                  //yeah,get the index of page successfully!

                                  print('$pageIndex');
                                  _textEditingController.text = "";

                                  //Do something
                                },
                                textInputAction: TextInputAction.search,
                                decoration: SearchBarDecoration),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      
                    ],
                  ),
                  
                ),
                actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.person_add_alt),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
          ];
        },
        body: cases != null
            ? ListView.builder(
                itemCount: cases.length,
                itemBuilder: (BuildContext listContext, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return PerpetratorDetails(
                              fullNames: cases[index].fullNames,
                            );
                          },
                        ),
                      );
                    },
                    child:Padding(
                      padding: EdgeInsets.fromLTRB(8,2,8,2),
                      child:Container(
                    height: 130,
                    margin: EdgeInsets.only(bottom: 8),
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: Colors.green[50]
                      ),
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
                      child: Row(
                        children: <Widget>[
                          cases[index].imageurl != null
                              ? Image.network(
                                  cases[index].imageurl,
                                  height: 120,
                                )
                              : Icon(
                                  Icons.person,
                                  color: Colors.greenAccent,
                                  size: 120,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 120,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Text(
                                    cases[index].fullNames,
                                    style: cardTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  cases[index].workplaceDetails,
                                  maxLines: 2,
                                  style: cardContextTextStyle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Text(
                                //   'to habitat loss & hunting',
                                //   style: cardContextTextStyle,
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.greenAccent,
                  strokeWidth: 2,
                ),
              ),
      ),
    );
  }
}

/*
class CaseCheckScreen extends StatefulWidget {
  @override
  _CaseCheckScreen createState() => _CaseCheckScreen();
}

class _CaseCheckScreen extends State<CaseCheckScreen> {
  String searchString;
  List<Perpetrators> cases;
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
              ),
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
      body: cases != null
          ? ListView.builder(
              itemCount: cases.length,
              itemBuilder: (BuildContext listContext, int index) {
                return cases.length != 0
                    ? Container(
                        height: 130,
                        margin: EdgeInsets.only(bottom:8),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            color: digestCardContextBackgroundColor,
                          ),
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
                          child: Row(
                            children: <Widget>[
                              cases[index].imageurl != null
                            ? Image.network(cases[index].imageurl,height: 120,)
                            : Icon(
                                Icons.person,
                                color: Colors.greenAccent,
                                size: 120,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 120,
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: Text(
                                        cases[index].fullNames,
                                        style: cardTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      cases[index].workplaceDetails,
                                      maxLines: 2,
                                      style: cardContextTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Text(
                                    //   'to habitat loss & hunting',
                                    //   style: cardContextTextStyle,
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
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
              },
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.greenAccent,
                strokeWidth: 2,
              ),
            ),
    );
  }
}
*/
