import 'dart:math';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map<String, String> address = {
    "street": "",
    "town": "",
    "city": "",
    "surname": "",
    "postalCode": "",
    "note": "",
  };

  Map<String, dynamic> auth = {
    "email": "",
    "password": "",
    "name": "",
    "surname": "",
    "phoneNumber": "",
    "address": {
      "street": "",
      "town": "",
      "city": "",
      "surname": "",
      "postalCode": "",
      "note": "",
    }
  };

  final _pageViewController =
      new PageController(initialPage: 0, viewportFraction: 1.0, keepPage: true);

  Widget _entryField(String title, String id, String hint,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              onChanged: (value) => {
                    setState(() {
                      auth[id] = value;
                    }),
                    print('TextField onChanged: ${auth.toString()}'),
                  },
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.orangeAccent[100],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(0.0, 36.0, 0.0, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              Row(children: <Widget>[
                GestureDetector(
                  onTap: () => _pageViewController.animateToPage(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _pageViewController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
                new Expanded(
                    child: new Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/menu');
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                      child: Text(
                        "Skip   ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ))
              ]),
              new Expanded(
                child: new Align(
                    alignment: Alignment.bottomCenter,
                    
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      padding: EdgeInsets.fromLTRB(2.0,45.0, 2.0,4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(45.0),topRight:Radius.circular(45.0))),
                      child: PageView(
                          controller: _pageViewController,
                          physics: new AlwaysScrollableScrollPhysics(),
                          children: <Widget>[
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Login Page",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12.0),
                                  ),
                                  _entryField('Name', 'name', 'Kwanele'),
                                  _entryField('Surname', 'surname', 'Motaung',
                                      isPassword: true),
                                  Material(
                                    elevation: 5,
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: MaterialButton(
                                      onPressed: () {
                                        //   Navigator.push(
                                        //     context,
                                        //     // MaterialPageRoute(builder: (context) => MyLoginPage()),
                                        //   );
                                      },
                                      minWidth: 200.0,
                                      height: 16.0,
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Center(
                                child: ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(8.0),
                                    children: <Widget>[
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Registration Page",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 12.0),
                                        ),
                                        //  email, password, name, surname, phoneNumber, address{ street, town, city, postalCode, note }
                                        _entryField('Name', 'name', 'Kwanele'),
                                        _entryField(
                                            'Surname', 'surname', 'Motaung',
                                            isPassword: true),
                                        _entryField('Contact Number',
                                            'phoneNumber', 'XXX XXX XXXX'),
                                        Text(
                                          "Address",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.0),
                                        ),
                                        _entryField('Street', 'address.street',
                                            '123 Amaza Street'),
                                        _entryField(
                                            'Town', 'address.town', 'Pinetown'),
                                        _entryField(
                                            'City', 'address.city', 'Durban'),
                                        _entryField('Postal Code',
                                            'address.postalCode', 'XXXX'),

                                        _entryField(
                                            'Email', 'email', 'mail@info.com'),
                                        _entryField(
                                          'Password',
                                          'password',
                                          '***********',
                                        ),

                                        Material(
                                          elevation: 5,
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: MaterialButton(
                                            onPressed: () {
                                              //                  Navigator.push(
                                              //                    context,
                                              //                    MaterialPageRoute(builder: (context) => MyLoginPage()),
                                              //                  );
                                            },
                                            minWidth: 200.0,
                                            height: 8.0,
                                            child: Text(
                                              "Register",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]))
                          ]),
                    )),
              )
            ])));
  }
}
