import 'package:flutter/material.dart';
import 'package:hand_speech/startup/SplashScreen.dart';
import 'package:hand_speech/dictionary/dictionaryAnimals.dart';
import 'package:hand_speech/dictionary/dictionaryFeelings.dart';
import 'package:hand_speech/dictionary/dictionaryFoods.dart';
import 'package:hand_speech/dictionary/dictionaryPlaylist.dart';
import 'package:hand_speech/dictionary/dictionaryQuestions.dart';
import 'package:hand_speech/dictionary/dictionarycolors.dart';
import 'package:hand_speech/dictionary/dictionaryletters.dart';
import 'package:hand_speech/dictionary/dictionarynumbers.dart';

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
          'playlist': (context) => DictionaryPlaylist(),
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
