import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hand_speech/home.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email, _password, _userName;
  bool _state = true;
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  checkAuthentification() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });

    @override
    void initstate() {
      super.initState();
      this.checkAuthentification();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                    child: Text(
                      'Hand',
                      style: GoogleFonts.abrilFatface(
                        color: Colors.black,
                        fontSize: 80.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text(
                      'Speech',
                      style: GoogleFonts.abrilFatface(
                        color: Colors.black,
                        fontSize: 80.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(330.0, 200.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: GoogleFonts.abrilFatface(
                          color: Color.fromRGBO(64, 72, 153, 1),
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'please enter email';
                          }
                        },
                        onSaved: (input) {
                          _email = input;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(64, 72, 153, 1)))),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        validator: (input) {
                          if (input.length < 8) {
                            return 'your password needs to be atleast 8 characters';
                          }
                        },
                        onSaved: (input) {
                          _password = input;
                        },
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(64, 72, 153, 1))),
                          suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(64, 72, 153, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        onSaved: (input) {
                          _userName = input;
                        },
                        decoration: InputDecoration(
                            labelText: 'NICK NAME ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(64, 72, 153, 1)))),
                      ),
                      SizedBox(height: 30.0),
                      ToggleSwitch(
                        labels: ["hearing", "deaf"],
                        minWidth: 120.0,
                        minHeight: 40.0,
                        initialLabelIndex: 0,
                        cornerRadius: 10.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        icons: [
                          Icons.hearing,
                          Elusive.asl,
                        ],
                        iconSize: 25.0,
                        activeBgColors: [
                          Color.fromRGBO(64, 72, 153, 1),
                          Color.fromRGBO(64, 72, 153, 1)
                        ],
                        onToggle: (index) {
                          _state = index == 0 ? true : false;
                          print('switched to: $index');
                          print(_state);
                        },
                      ),
                      SizedBox(height: 30.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Color.fromRGBO(64, 72, 153, .5),
                            color: Color.fromRGBO(64, 72, 153, 1),
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                signUp();
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            )
          ]),
    ));
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        if (user != null) {
          UserUpdateInfo updateUser = UserUpdateInfo();
          updateUser.displayName = _userName;
          user.updateProfile(updateUser);
          Firestore.instance.collection('users').document(user.uid).setData(
              {'username': _userName, 'email': _email, 'state': _state});
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } catch (e) {
        showError("please try again , check your information!");
      }
    }
  }

  showError(String errormeesage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errormeesage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: null)
            ],
          );
        });
  }
}
