import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:qaphelaMobile/model/menu-button.dart';
import 'package:qaphelaMobile/shared/widgets/blinking-button.dart';
import 'package:qaphelaMobile/shared/widgets/utils.dart';
import 'package:qaphelaMobile/views/landing.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuSeen createState() => _MenuSeen();
}

class _MenuSeen extends State<MenuScreen> {
  Widget menuButton(MenuButton menuButton, BuildContext context) {
    return new AnimatedContainer(
      duration: Duration(milliseconds: 5),
      curve: Curves.bounceOut,
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.redAccent[200],
        // border: Border.all(
        //   width: 2.0,
        //   // color: Colors.blueAccent.withOpacity(0.7),
        // ),
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: new Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                      IconData(menuButton.icon, fontFamily: 'MaterialIcons')),
                  iconSize: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                  onPressed: () => _handleClick(menuButton.label, context)),
              Text(
                menuButton.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onTap: () => _handleClick(menuButton.label, context)),
    );
  }

  List<MenuButton> menuItems = [
    MenuButton.fromJson({'label': 'FetchMe', 'icon': 59512}),
    MenuButton.fromJson({'label': 'CaseCheck', 'icon': 57535}),
  ];

  Widget myMenu(List<MenuButton> list, BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: list.map((item) => menuButton(item, context)).toList());
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return new Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   brightness: Brightness.dark,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.power_settings_new),
      //       iconSize: 36.0,
      //       color: Colors.white,
      //       onPressed: () {
      //         Navigator.pushReplacementNamed(context, '/');
      //       },
      //     ),
      //   ],
      // ),
      // backgroundColor: Colors.orangeAccent[100],
      body: WillPopScope(
        onWillPop: () async => Future.value(false),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: MyMenu(menuItems),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleClick(String path, BuildContext event) {
    switch (path) {
      case 'FetchMe':
        Navigator.pushNamed(event, '/fetchMe');
        break;
      case 'CaseCheck':
        Navigator.pushNamed(event, '/caseCheck');
        break;
      default:
        break;
    }
  }
}

class MyMenu extends StatelessWidget {
  List<MenuButton> list;

  MyMenu(this.list);

  MyMenu.extended();

  MenuButton menuButton;

  Widget showForm(BuildContext context){
    return AlertDialog(
              title: Container(
                  alignment: Alignment.center,
                  child: Text("Schedule FetchMe Request",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        // fontSize: 18.0,
                        // fontFamily: 'helvetica_neue_light',
                      ))),
              content: MyCustomForm(),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            );
  }

  void _handleClick(String path, BuildContext event) {
    switch (path) {
      case 'FetchMe':
        // Navigator.pushNamed(event, '/fetchMe');
        showDialog(
          context: event,
          builder: (context) {
            return AlertDialog(
              title: Container(
                  alignment: Alignment.center,
                  child: Text("Fetch Me Options",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        // fontSize: 18.0,
                        // fontFamily: 'helvetica_neue_light',
                      ))),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new Text(
                        'FetchMe is a service designed for users who either need help right now or need an escape plan to leave an abuser',
                        maxLines: 5,
                        overflow: TextOverflow.fade,
                        style: cardTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // dialog centre

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(2.0),
                            child: MyBlinkingButton(),
                          ),
                          new Padding(
                            padding: new EdgeInsets.all(2.0),
                            child: MaterialButton(
                              onPressed: () => {
                                Navigator.of(context).pop(),
                                Navigator.popAndPushNamed(context, '/fetchMe'),
                                // showForm(event),
                                },
                              child: Text("Plan Escape"),
                              color: Colors.greenAccent,
                            ),
                          ),
                        ])

                    // dialog bottom
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            );
          },
        );
        break;
      case 'CaseCheck':
        Navigator.pushNamed(event, '/caseCheck');
        break;
      default:
        break;
    }
  }

  LatLng _initialcameraposition = LatLng(27.944183, -26.259960);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              // onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            Center(child:ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              children: list
                  .map(
                    (item) => MenuButtonWidget(
                      bc: context,
                      mb: item,
                    ),
                  )
                  .toList(),
            ))
          ],
        )),
      
    );
  }
}

// ignore: must_be_immutable
class MenuButtonWidget extends StatelessWidget {
  MenuButton mb;
  BuildContext bc;

  MenuButtonWidget({Key key, @required this.mb, @required this.bc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => MyMenu.extended()._handleClick(mb.label, bc),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 5),
            curve: Curves.bounceOut,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orangeAccent[100],
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
            ),
            // padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              mb.label,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                color: Colors.black,
              ),
            )));
  }
}
