import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hand_speech/SignupScreen.dart';
import 'package:hand_speech/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hand_speech/resetScreen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

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
                  child: Text('Hand',
                      style: GoogleFonts.abrilFatface(
                        color: Colors.black,
                        fontSize: 80.0,
                      )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('Speech',
                      style: GoogleFonts.abrilFatface(
                        color: Colors.black,
                        fontSize: 80.0,
                      )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(280.0, 175.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: GoogleFonts.abrilFatface(
                        color: Color.fromRGBO(64, 72, 153, 1),
                        fontSize: 80.0,
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
                    SizedBox(height: 20.0),
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
                        labelText: 'PASSWORD',
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
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetScreen()));
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Color.fromRGBO(64, 72, 153, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
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
                                logIn();
                              },
                              child: Text(
                                'LOGIN',
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
                          child: Center(
                            child: Text('Log in with gmail',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          )),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to Hand Speech ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Color.fromRGBO(64, 72, 153, 1),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  Future<void> logIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } catch (e) {
        showError("e.errormessage");
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
