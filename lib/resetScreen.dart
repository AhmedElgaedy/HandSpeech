import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hand_speech/startup/LogInScreen.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 72, 153, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogInScreen())),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/undraw_Login_re_4vu2.png",
                      width: 400, height: 400)),
              Form(
                key: _formKey,
                child: TextFormField(
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
              ),
              SizedBox(height: 40.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Color.fromRGBO(64, 72, 153, .5),
                  color: Color.fromRGBO(64, 72, 153, 1),
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          final formState = _formKey.currentState;
                          if (formState.validate()) {
                            formState.save();
                            try {
                              _auth.sendPasswordResetEmail(email: _email);
                              Navigator.of(context).pop();
                            } catch (e) {
                              showError("e.errormessage");
                            }
                          }
                        },
                        child: Text(
                          'Send Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
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
