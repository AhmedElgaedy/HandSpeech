import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hand_speech/startup/LogInScreen.dart';
import 'package:hand_speech/drawer.dart';

class HomeScreen extends StatefulWidget {
  File image;
  HomeScreen({Key key, this.image}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloggedIn = false;
  FirebaseUser user;

  checkAuthentification() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInScreen()));
      }
    });
  }

  var userName;
  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedIn = true;
      });
    }
  }

  @override
  void initstate() {
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromRGBO(64, 72, 153, 1),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Hand Speech",
          style:
              GoogleFonts.abrilFatface(color: Color.fromRGBO(64, 72, 153, 1)),
        ),
      ),
      drawer: Drawer(
        elevation: 18,
        child: MainDrawer(image: widget.image),
      ),
      body: SafeArea(
        bottom: true,
        left: true,
        right: true,
        top: true,
        child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Card(
                      shadowColor: Color.fromRGBO(247, 173, 174, 1),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width * .75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(64, 72, 153, 1),
                            width: 3,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Ink.image(
                            //   image: AssetImage(
                            //     'assets/images/resetpass.png',
                            //   ),
                            //   child: InkWell(
                            //     onTap: () {},
                            //   ),
                            //   height: 240,
                            //   fit: BoxFit.cover,
                            // ),
                            Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  'ASL Translation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Color.fromRGBO(64, 72, 153, 1),
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  'ASL Translation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shadowColor: Color.fromRGBO(247, 173, 174, 1),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width * .75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(64, 72, 153, 1),
                            width: 3,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Ink.image(
                            //   image: AssetImage(
                            //     'assets/images/resetpass.png',
                            //   ),
                            //   child: InkWell(
                            //     onTap: () {},
                            //   ),
                            //   height: 240,
                            //   fit: BoxFit.cover,
                            // ),
                            Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  'Speech Translation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Color.fromRGBO(64, 72, 153, 1),
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  'Speech Translation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shadowColor: Color.fromRGBO(247, 173, 174, 1),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width * .75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(64, 72, 153, 1),
                            width: 3,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Ink.image(
                            //   image: AssetImage(
                            //     'assets/images/resetpass.png',
                            //   ),
                            //   child: InkWell(
                            //     onTap: () {},
                            //   ),
                            //   height: 240,
                            //   fit: BoxFit.cover,
                            // ),
                            Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  'Both Translation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Color.fromRGBO(64, 72, 153, 1),
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  'Both Translation',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Card(
                      shadowColor: Color.fromRGBO(247, 173, 174, 1),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(64, 72, 153, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'recent',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Color.fromRGBO(247, 173, 174, 1),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(64, 72, 153, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'favorites',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
