import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';

class translation extends StatefulWidget {
  const translation({key}) : super(key: key);

  @override
  _translationState createState() => _translationState();
}

class _translationState extends State<translation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 0, 0, 1),
        leading:
        IconButton(
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen()));},
            icon: Icon(Icons.arrow_back_ios_sharp,color: Color.fromRGBO(64, 72, 153, 1),)),
        title: Text(
          "Hand Speech",
          style:
          GoogleFonts.abrilFatface(color: Color.fromRGBO(64, 72, 153, 1)),
        ),
      ),
        body:SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
      ],
     )
    ),
    );
  }
}
