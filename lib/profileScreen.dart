import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:hand_speech/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  var db = FirebaseDatabase.instance.reference().child("users");
  String _userid;

  // @override
  // void initstate() async {
  //   super.initState();
  //   StorageReference _reference = FirebaseStorage.instance.ref();
  //   print(_image.toString() + "look");
  //   if(_reference.getMetadata().toString() == _userid)
  //   _image = await _reference.getDownloadURL();
  //   //  var image = await _reference.child(StorageMetadata(StorageMetadata(customMetadata: {'uploaded_by': _userid})).getDownloadURL();
  //   //  _image = image;
  // }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      final picker = ImagePicker();
      // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      var image = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image.path);
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(
          _image,
          StorageMetadata(customMetadata: {
            'uploaded_by': _userid,
          }));

      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    Future<DocumentSnapshot> getDocument() async {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      _userid = firebaseUser.uid;
      return Firestore.instance
          .collection("users")
          .document(firebaseUser.uid)
          .get();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 72, 153, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(image: _image)));
            }),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(64, 72, 153, 1),
                          Colors.blue[100],
                        ],
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.blue[100],
                              child: ClipOval(
                                child: new SizedBox(
                                  width: 120.0,
                                  height: 120.0,
                                  child: (_image != null)
                                      ? Image.file(
                                          _image,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.network(
                                          "https://scx1.b-cdn.net/csz/news/800a/2017/signlanguage.png",
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 80.0, left: 100),
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_enhance,
                                color: Color.fromRGBO(64, 72, 153, 1),
                                size: 35.0,
                              ),
                              onPressed: () {
                                getImage();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.30,
              left: 20.0,
              right: 20.0,
              child: Card(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: 310.0,
                  height: 170.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: getDocument(),
                              builder: (context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Text(
                                    snapshot.data["username"].toString(),
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  );
                                } else if (snapshot.connectionState ==
                                    ConnectionState.none) {
                                  return Text("No data");
                                }
                                return CircularProgressIndicator(
                                  value: 2,
                                );
                              },
                            ),
                            Divider(
                              color: Colors.grey[300],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                  future: getDocument(),
                                  builder: (context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Icon(
                                        snapshot.data["state"].toString() ==
                                                "true"
                                            ? Icons.hearing
                                            : Elusive.asl,
                                        color: Color.fromRGBO(64, 72, 153, 1),
                                        size: 35,
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.none) {
                                      return Text("No data");
                                    }
                                    return CircularProgressIndicator(
                                      value: 2,
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "State",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: getDocument(),
                                      builder: (context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Text(
                                            snapshot.data["state"].toString() ==
                                                    "true"
                                                ? "hearing"
                                                : "deaf",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[400],
                                            ),
                                          );
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.none) {
                                          return Text("No data");
                                        }
                                        return CircularProgressIndicator(
                                          value: 2,
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Color.fromRGBO(64, 72, 153, 1),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: getDocument(),
                                      builder: (context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Text(
                                            snapshot.data["email"].toString(),
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[400],
                                            ),
                                          );
                                        } else if (snapshot.connectionState ==
                                            ConnectionState.none) {
                                          return Text("No data");
                                        }
                                        return CircularProgressIndicator(
                                          value: 2,
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.70,
              left: 20.0,
              right: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    onPressed: () {
                      uploadPic(context);
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
