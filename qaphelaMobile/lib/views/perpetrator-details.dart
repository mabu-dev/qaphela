import 'package:flutter/material.dart';
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/model/perpetrator.dart';
import 'package:qaphelaMobile/shared/widgets/PerpetratorEntry.dart';

class PerpetratorDetails extends StatefulWidget {
  final String fullNames;
  PerpetratorDetails({Key key, this.fullNames}) : super(key: key);

  @override
  _PerpetratorDetailsState createState() => _PerpetratorDetailsState();
}

class _PerpetratorDetailsState extends State<PerpetratorDetails> {
  List<CheckCase> per = [
    CheckCase.fromJson({
      "id": 2,
      "reporter": {
        "user": {
          "id": 1,
          "username": "0817189287",
          "first_name": "Mabu",
          "last_name": "Manaileng",
          "email": "ManailengMJ@gmail.com"
        },
        "user_type": "STANDARD",
        "imageurl": null,
        "is_dispatch_user": true,
        "social_profiles": {
          "id": 1,
          "name": "Twitter",
          "profile_page": "https://twitter.com/thisMabu"
        },
        "contact_details": {
          "id": 1,
          "primary_contact_number": "0817189287",
          "secondary_contact_number": "0798595080",
          "next_of_kin_firstname": "Mabu",
          "next_of_kin_lastname": "Manaileng",
          "next_of_kin_primary_contact_number": "0817189287",
          "next_of_kin_secondary_contact_number": null
        },
        "address": {
          "address": "29 2nd Ave, Nigel, 1490, South Africa",
          "city": "Nigel",
          "country": "South Africa",
          "lattitude": "-26.417990000000003",
          "longitude": "28.469309999999997",
          "postal_code": "1490",
          "province": "Gauteng",
          "street_name": "2nd Avenue",
          "street_number": "29",
          "suburb": "Nigel"
        }
      },
      "perpetrators": {
        "full_names": "Diego Masemola",
        "imageurl": null,
        "workplace_details":
            "Research Scientist at Datawizzards as of October 2020",
        "contact_details": {
          "id": 2,
          "primary_contact_number": "0798595080",
          "secondary_contact_number": null,
          "next_of_kin_firstname": null,
          "next_of_kin_lastname": null,
          "next_of_kin_primary_contact_number": null,
          "next_of_kin_secondary_contact_number": null
        },
        "social_profiles": {
          "id": 1,
          "name": "Twitter",
          "profile_page": "https://twitter.com/thisMabu"
        }
      },
      "title": "Diego Masemola raped me",
      "report_type": "REPORT",
      "occasion": "WORK",
      "preview":
          "We were at a work function when we both got drunk. He forced to come to my room with me and forced himself on me, after I repeatedly said NO!, STOP! I reported him to HR and he admitted guilt, he was subsequently fired from the company. We settled things out of court.",
      "when": "2020-02-23T00:00:00Z",
      "frequency": 1,
      "date_reported": "2020-10-11T21:10:46.443881Z",
      "case_status": "VERIFIED",
      "settlement_type": "OUT OF COURT",
      "police_case_number": "2020/01/234"
    }),
    CheckCase.fromJson({
      "id": 3,
      "reporter": {
        "user": {
          "id": 1,
          "username": "0817189287",
          "first_name": "Mabu",
          "last_name": "Manaileng",
          "email": "ManailengMJ@gmail.com"
        },
        "user_type": "STANDARD",
        "imageurl": null,
        "is_dispatch_user": true,
        "social_profiles": {
          "id": 1,
          "name": "Twitter",
          "profile_page": "https://twitter.com/thisMabu"
        },
        "contact_details": {
          "id": 1,
          "primary_contact_number": "0817189287",
          "secondary_contact_number": "0798595080",
          "next_of_kin_firstname": "Mabu",
          "next_of_kin_lastname": "Manaileng",
          "next_of_kin_primary_contact_number": "0817189287",
          "next_of_kin_secondary_contact_number": null
        },
        "address": {
          "address": "29 2nd Ave, Nigel, 1490, South Africa",
          "city": "Nigel",
          "country": "South Africa",
          "lattitude": "-26.417990000000003",
          "longitude": "28.469309999999997",
          "postal_code": "1490",
          "province": "Gauteng",
          "street_name": "2nd Avenue",
          "street_number": "29",
          "suburb": "Nigel"
        }
      },
      "perpetrators": {
        "full_names": "Doctor Loyd Munyai",
        "imageurl": null,
        "workplace_details":
            "Director of Mobile Development at Datawizzards as of October 2020",
        "contact_details": {
          "id": 3,
          "primary_contact_number": "0716334002",
          "secondary_contact_number": null,
          "next_of_kin_firstname": null,
          "next_of_kin_lastname": null,
          "next_of_kin_primary_contact_number": null,
          "next_of_kin_secondary_contact_number": null
        },
        "social_profiles": {
          "id": 2,
          "name": "Twitter",
          "profile_page": "https://twitter.com/LloydDoctor"
        }
      },
      "title": "Doctor Abused Me",
      "report_type": "REPORT",
      "occasion": "EVENT",
      "preview":
          "I went to a party with Doctor and his friends, at the party he claimed to his friends that we're dating. He groped and kissed me without my consent.",
      "when": "2020-04-23T00:00:00Z",
      "frequency": 1,
      "date_reported": "2020-10-14T11:49:00.408106Z",
      "case_status": "UNVERIFIED",
      "settlement_type": "OUT OF COURT",
      "police_case_number": "2020/01/234"
    }),
    CheckCase.fromJson({
      "id": 4,
      "reporter": {
        "user": {
          "id": 1,
          "username": "0817189287",
          "first_name": "Mabu",
          "last_name": "Manaileng",
          "email": "ManailengMJ@gmail.com"
        },
        "user_type": "STANDARD",
        "imageurl": null,
        "is_dispatch_user": true,
        "social_profiles": {
          "id": 1,
          "name": "Twitter",
          "profile_page": "https://twitter.com/thisMabu"
        },
        "contact_details": {
          "id": 1,
          "primary_contact_number": "0817189287",
          "secondary_contact_number": "0798595080",
          "next_of_kin_firstname": "Mabu",
          "next_of_kin_lastname": "Manaileng",
          "next_of_kin_primary_contact_number": "0817189287",
          "next_of_kin_secondary_contact_number": null
        },
        "address": {
          "address": "29 2nd Ave, Nigel, 1490, South Africa",
          "city": "Nigel",
          "country": "South Africa",
          "lattitude": "-26.417990000000003",
          "longitude": "28.469309999999997",
          "postal_code": "1490",
          "province": "Gauteng",
          "street_name": "2nd Avenue",
          "street_number": "29",
          "suburb": "Nigel"
        }
      },
      "perpetrators": {
        "full_names": "Bonginkosi Lukhele",
        "imageurl": null,
        "workplace_details":
            "Head of Mobile Development at Datawizzards as of October 2020",
        "contact_details": {
          "id": 4,
          "primary_contact_number": "0727308412",
          "secondary_contact_number": null,
          "next_of_kin_firstname": null,
          "next_of_kin_lastname": null,
          "next_of_kin_primary_contact_number": null,
          "next_of_kin_secondary_contact_number": null
        },
        "social_profiles": null
      },
      "title": "Bonginkosi Beat Me Up",
      "report_type": "REPORT",
      "occasion": "HOME",
      "preview":
          "I dated him for 3 years, and he got addicted to alcohol making me his punch box for all 3 years until I left the relationship.",
      "when": "2019-01-01T00:00:00Z",
      "frequency": 1,
      "date_reported": "2020-10-14T11:55:30.470144Z",
      "case_status": "VERIFIED",
      "settlement_type": "IN COURT",
      "police_case_number": "2019/05/123"
    })
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              backgroundColor: Colors.greenAccent,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                    (widget.fullNames != null ? widget.fullNames : null),
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                background: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 30,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ))
        ];
      },
      body: new Container(
        padding: EdgeInsets.fromLTRB(2, 16, 0, 0),
        color: Colors.white,
        child: new ListView.builder(
            itemCount: per.length,
            itemBuilder: (BuildContext listContext, int index) {
              return PerpetratorEntry(checkCase: per[index]);
            }),
      ),
    ));
  }
}
