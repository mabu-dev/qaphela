import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:qaphelaMobile/model/address.dart';
import 'package:qaphelaMobile/model/contactDetails.dart';
import 'package:qaphelaMobile/model/fetch-me.dart';
import 'package:qaphelaMobile/model/pick-up-address.dart';
import 'package:qaphelaMobile/net/api.dart';
import 'package:qaphelaMobile/shared/widgets/case-edittext.dart';
import 'package:qaphelaMobile/shared/widgets/utils.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// For changing the language
import 'dart:async';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const kGoogleApiKey = "AIzaSyCh77yuA_vMiRDx9YEgv20PY-gxc1_Y6ls";

// to get places detail (lat/lng)
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  MyApi api = MyApi();
  Mode _mode = Mode.overlay;
  bool loading = false;
  String postError;
  FetchMe fetch;
  Map<String, dynamic> fetchMe = new Map<String, dynamic>();
  Map<String, dynamic> contact = new Map<String, dynamic>();
  Map<String, dynamic> address = new Map<String, dynamic>();


  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected

    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "en-za",
      components: [Component(Component.country, "za")],
    );
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);

    address['address'] = detail.result.formattedAddress;
    address['city'] = detail.result.addressComponents[3].longName;
    address['country'] = detail.result.addressComponents[6].longName;
    address['lattitude'] = detail.result.geometry.location.lat.toString();
    address['longitude'] = detail.result.geometry.location.lng.toString();
    address['postal_code'] = detail.result.formattedAddress.split(',')[3];
    address['province'] = detail.result.addressComponents[5].longName;
    address['street_name'] = detail.result.addressComponents[1].shortName;
    address['street_number'] = detail.result.addressComponents[0].shortName;
    address['suburb'] = detail.result.addressComponents[2].longName;

    displayPrediction(p, homeScaffoldKey.currentState);
  }

  final _formKey = GlobalKey<FormState>();

  void handleInput(Key id, String value) {
    String identifier = id.toString().split('\'')[1];

    fetchMe[identifier] = value;
  }

  void handleAddress(Key id, String value) {
    String identifier = id.toString().split('\'')[1];
    contact[identifier] = value;
  }

  void handleDate(DateTime value) {
    fetchMe['pickup_time'] = value.toString();
  }

  void sendRequest(Map<String, dynamic> data) async {
    try {
      FetchMe response = await api.fetchMeRequest(data);
      setState(() => {fetch = response, loading = false});

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              " Request Success Created",
              style: TextStyle(color: Colors.green),
            )),
            
            content: Container(
                height: 100,
                child: Center(
                    child: Column(children: <Widget>[
                  Text('Request Status: ${fetch.incidentStatus}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 18),
                  ),
                  Center(
                      child: Text(
                    'Please keep safe ${fetch.victimFullNames},\nwe will give you further directions on your case',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ))
                ]))),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Ok'),
                  onPressed: () {
                   
                    Navigator.of(context).pop();
                  })
            ],
          );
        },
      );
    } catch (e) {

      setState(() => {loading: false, postError: e.toString()});
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(" Request Failed", style: TextStyle(color:Colors.orange))),

            content: Container( height:40, child:Center(child: Text('Please ensure that all fields are filled out and try Again'))),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Ok'),
                  onPressed: () {
                    setState(()=> {
                      loading = false
                    });
                    Navigator.of(context).pop();
                  })
            ],
          );
        },
      );
    }
  }

  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          title: Text(
            "Schedule FetchMe",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: MediaQuery.of(context).size.width * 0.08,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        extendBodyBehindAppBar: false,
        body: Container(
            padding: EdgeInsets.fromLTRB(4, 36, 4, 2),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                  0.2,
                  0.4,
                  0.6,
                  0.8,
                ],
                    colors: [
                  Colors.yellow[50],
                  Colors.lightGreen[50],
                  Colors.yellow[50],
                  Colors.lightGreen[50],
                ])),
            child: loading == true
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.greenAccent,
                      strokeWidth: 2,
                    ),
                  )
                : Form(
                    key: _formKey,
                    child: ListView(
                        // direction: Axis.vertical,
                        children: [
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              margin: EdgeInsets.only(top: 12.0),
                              child: CaseEditText(
                                  key: Key('victim_full_names'),
                                  title: 'Name',
                                  text: 'Enter your full name',
                                  onChange: handleInput,
                                  inputType: TextInputType.name)),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              margin: EdgeInsets.only(top: 12.0),
                              child: CaseEditText(
                                  key: Key('primary_contact_number'),
                                  title: 'Contact Number',
                                  text: 'Enter your cell phone number',
                                  onChange: handleAddress,
                                  inputType: TextInputType.phone)),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              margin: EdgeInsets.only(top: 12.0),
                              child: CaseEditText(
                                  key: Key('next_of_kin_firstname'),
                                  title: 'Next Of Kin Name',
                                  text: 'Next of kin name',
                                  onChange: handleAddress,
                                  inputType: TextInputType.name)),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              margin: EdgeInsets.only(top: 12.0),
                              child: CaseEditText(
                                  key: Key('next_of_kin_lastname'),
                                  title: 'Next Of Kin last',
                                  text: 'Next of kin last name',
                                  onChange: handleAddress,
                                  inputType: TextInputType.name)),
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              margin: EdgeInsets.only(top: 12.0),
                              child: CaseEditText(
                                  key:
                                      Key('next_of_kin_primary_contact_number'),
                                  title: 'Next Of Kin Cellphone',
                                  text: 'Next of kin Cellphone',
                                  onChange: handleAddress,
                                  inputType: TextInputType.phone)),
                          Container(
                            alignment: Alignment(-1.0, -1.0),
                            margin: EdgeInsets.only(top: 12.0),
                            child: DateTimeField(
                                onChanged: (value) => handleDate(value),
                                format: format,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2020),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2022));

                                  if (date != null) {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          currentValue ?? DateTime.now()),
                                    );
                                    return DateTimeField.combine(date, time);
                                  } else {
                                    return currentValue;
                                  }
                                },
                                decoration: InputDecoration(
                                    // id: id,
                                    labelText: 'FetchMe Time',
                                    border: OutlineInputBorder(),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true)),
                          ),
                          Center(child:Container(
                            padding: EdgeInsets.fromLTRB(4, 16, 4, 16),
                              width: MediaQuery.of(context).size.width*0.8,
                              child: MaterialButton(
                                color: Colors.orangeAccent,
                                onPressed: _handlePressButton,
                                child: Text("Search Your Address", style:TextStyle(fontWeight: FontWeight.w300),)))),
                          Padding(padding: EdgeInsets.only(bottom: 24)),
                          Center(
                              child: Material(
                            elevation: 5,
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(12.0),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  loading = true;
                                });
                                fetchMe['pickup_address'] = address;
                                fetchMe['contact_details'] = contact;
                                fetchMe['incident_type'] = 'SCHEDULE';

                                sendRequest(fetchMe);
                              },
                              minWidth: 200.0,
                              height: 8.0,
                              child: Text(
                                "Schedule FetchMe",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0),
                              ),
                            ),
                          )),
                        ]),
                  )));
  }
}

class CustomSearchScaffold extends PlacesAutocompleteWidget {
  CustomSearchScaffold()
      : super(
          apiKey: kGoogleApiKey,
          // sessionToken: Uuid().generateV4(),
          language: "en",
          components: [Component(Component.country, "za")],
        );

  @override
  _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
}

Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
  if (p != null) {
    // get detail (lat/lng)
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    final lat = detail.result.geometry.location.lat;
    final lng = detail.result.geometry.location.lng;

    // scaffold.showSnackBar(
    //   SnackBar(content: Text("${p.description} - $lat/$lng")),
    // );
  }
}

class _CustomSearchScaffoldState extends PlacesAutocompleteState {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
    final body = PlacesAutocompleteResult(
      onTap: (p) {
        displayPrediction(p, searchScaffoldKey.currentState);
      },
      logo: Row(
        children: [FlutterLogo()],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    searchScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  @override
  void onResponse(PlacesAutocompleteResponse response) {
    super.onResponse(response);
    if (response != null && response.predictions.isNotEmpty) {
      searchScaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Got answer")),
      );
    }
  }
}
