import 'package:flutter/material.dart';
import 'package:qaphelaMobile/views/case-details.dart';


class PerpetratorDetails extends StatefulWidget {
  final String fullNames;
  PerpetratorDetails({Key key, this.fullNames}) : super(key: key);

  @override
  _PerpetratorDetailsState createState() => _PerpetratorDetailsState();
}

class _PerpetratorDetailsState extends State<PerpetratorDetails> {
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
          // title: _entryField(
          //     "Search", 'search', 'search abuser by name o Image', context),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext listContext, int index) {
              return Card(
                      child: ListTile(
                        // onTap: () {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (_) {
                        //     return CaseDetails(
                        //       checkCase: new CheckCase(),
                        //     );
                        //   }));
                        // },
                        leading: "imageurl" != null
                            ? Image.network("imageurl")
                            : Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 30,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                        title: Text('fullNames'),
                        subtitle: Text(
                          'workplaceDetails',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ),
                    );
            }));
  }
}