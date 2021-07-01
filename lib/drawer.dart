import 'package:flutter/material.dart';
import 'package:hand_speech/dictionaryScreen.dart';
import 'package:hand_speech/profileScreen.dart';

import 'LogInScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: NetworkImage(
                    'https://scx1.b-cdn.net/csz/news/800a/2017/signlanguage.png'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "User name",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "speaker / deaf ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
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
          color:Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("Profile"),
      ),


      ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DictionaryScreen()));
        },
        leading: Icon(
          Icons.book,
          color:Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("Dictionary"),
      ),

      ListTile(
        onTap: () {},
        leading: Icon(
          Icons.settings,
          color:Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("Settings"),
      ),

      ListTile(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>LogInScreen()));
        },
        leading: Icon(
          Icons.logout,
          color:Color.fromRGBO(64, 72, 153, 1),
        ),
        title: Text("Logout"),
      )
    ]);
  }
}
