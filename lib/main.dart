import 'package:flutter/material.dart';
import 'package:hand_speech/SplashScreen.dart';
import 'package:hand_speech/dictionaryAnimals.dart';
import 'package:hand_speech/dictionaryFeelings.dart';
import 'package:hand_speech/dictionaryFoods.dart';
import 'package:hand_speech/dictionaryQuestions.dart';
import 'package:hand_speech/dictionarycolors.dart';
import 'package:hand_speech/dictionaryletters.dart';
import 'package:hand_speech/dictionarynumbers.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return null;
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return  MaterialApp(

              debugShowCheckedModeBanner: false,
              routes: {
                'splash': (context) => SplashScreen(),
                'letters': (context) => DictionaryLetters(),
                'numbers': (context) => DictionaryNumbers(),
                'colors': (context) => DictionaryColors(),
                'foods': (context) => DictionaryFoods(),
                'animals': (context) => DictionaryAnimals(),
                'feelings': (context) => DictionaryFeelings(),
                'questions': (context) => DictionaryQuestions(),
              },
              initialRoute: 'splash'
          );
        }}
    );
  }
}
