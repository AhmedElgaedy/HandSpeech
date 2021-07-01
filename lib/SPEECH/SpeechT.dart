import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microphone/microphone.dart';
import 'package:hand_speech/SPEECH/Recording.dart';
import '../home.dart';



class speechT extends StatefulWidget {
  const speechT({Key key}) : super(key: key);

  @override
  _speechTState createState() => _speechTState();
}

class _speechTState extends State<speechT> {
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
      ) ,
      backgroundColor:Colors.white,
      body:
      SafeArea(
        top:true,
        bottom: true ,
        left: true ,
        right: true,
        child: Column(

          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/9,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(64, 72, 153, 1),
                  borderRadius: BorderRadius.circular(10),

                ),
                child:Recodingclass(),

              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/9,
            ),

           Align(
           alignment: Alignment.center,
           child: Container(
             alignment: Alignment.center,
             height: MediaQuery.of(context).size.height/3,
             width: MediaQuery.of(context).size.width * .8,
             decoration: BoxDecoration(
               color: Color.fromRGBO(64, 72, 153, 1),
               borderRadius: BorderRadius.circular(10),

             ),
             child:Recodingclass(),
           ),
           ),
               ],
             ),
           ) ,

    );
  }
}




 

