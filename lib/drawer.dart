import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:hand_speech/startup/LogInScreen.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';
import 'package:hand_speech/grammerScreen.dart';
import 'package:hand_speech/helpScreen.dart';
import 'package:hand_speech/profileScreen.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  File image;
  MainDrawer({Key key, this.image}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  String _userid;

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> getDocument() async {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      _userid = firebaseUser.uid;
      return Firestore.instance
          .collection("users")
          .document(firebaseUser.uid)
          .get();
    }

    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.blue[100],
                child: ClipOval(
                  child: new SizedBox(
                    width: 120.0,
                    height: 120.0,
                    child: (image != null)
                        ? Image.file(
                            image,
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            "https://scx1.b-cdn.net/csz/news/800a/2017/signlanguage.png",
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                future: getDocument(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(snapshot.data["username"].toString(),
                        style: TextStyle(
                            color: Color.fromRGBO(64, 72, 153, 1),
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w800));
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                  return CircularProgressIndicator();
                },
              ),

              // FutureBuilder(
              //   future: getDocument(),
              //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       return Text(
              //         snapshot.data["state"].toString() == "true"
              //             ? "hearing"
              //             : "deaf",
              //         style: TextStyle(
              //             color: Color.fromRGBO(64, 72, 153, 1), fontSize: 10),
              //       );
              //     } else if (snapshot.connectionState == ConnectionState.none) {
              //       return Text("No data");
              //     }
              //     return CircularProgressIndicator();
              //   },
              // ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 40.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        leading: Icon(
          Icons.person,
          color: Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("Your Profile",
            style: TextStyle(
              color: Color.fromRGBO(64, 72, 153, 1),
              fontFamily: 'Montserrat',
            )),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DictionaryScreen()));
        },
        leading: Icon(
          Elusive.book,
          color: Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("Dictionary",
            style: TextStyle(
              color: Color.fromRGBO(64, 72, 153, 1),
              fontFamily: 'Montserrat',
            )),
      ),
      SizedBox(
        height: 20.0,
      ),

      ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GrammerScreen()));
        },
        leading: Icon(
          Icons.g_translate,
          color: Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("ASL Grammar",
            style: TextStyle(
              color: Color.fromRGBO(64, 72, 153, 1),
              fontFamily: 'Montserrat',
            )),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FAQScreen()));
        },
        leading: Icon(
          Icons.help,
          color: Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("FAQ",
            style: TextStyle(
              color: Color.fromRGBO(64, 72, 153, 1),
              fontFamily: 'Montserrat',
            )),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          _signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LogInScreen()));
        },
        leading: Icon(
          Icons.exit_to_app,
          color: Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text(
          "SignOut",
          style: TextStyle(
            color: Color.fromRGBO(64, 72, 153, 1),
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    ]);
  }
}
