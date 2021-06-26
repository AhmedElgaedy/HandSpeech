import 'package:flutter/material.dart';
import 'package:hand_speech/SplashScreen.dart';
import 'package:hand_speech/dictionaryAnimals.dart';
import 'package:hand_speech/dictionaryFeelings.dart';
import 'package:hand_speech/dictionaryFoods.dart';
import 'package:hand_speech/dictionaryQuestions.dart';
import 'package:hand_speech/dictionarycolors.dart';
import 'package:hand_speech/dictionaryletters.dart';
import 'package:hand_speech/dictionarynumbers.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        initialRoute: 'splash');
  }
}
