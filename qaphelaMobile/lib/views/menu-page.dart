import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/menu-button.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            iconSize: 36.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      backgroundColor: Colors.orangeAccent[100],
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
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
      ),
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
