import 'package:flutter/material.dart';
import 'package:hand_speech/home.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  List<String> images = [
    "assets/images/dictionary/diction_main.jpg",
    "assets/images/dictionary/colors.jpg",
    "assets/images/dictionary/numbers.png",
    "assets/images/dictionary/letters.png",
    "assets/images/dictionary/animals.png",
    "assets/images/dictionary/food.jpg",
    "assets/images/dictionary/people.jpg",
    "assets/images/dictionary/questions.jpg",
  ];

  List<String> titles = [
    "ASL Basics playlist",
    "Colors",
    "Numbers",
    "Letters",
    "Animals",
    "Foods & Drinks",
    "Feelings",
    "Questions",
  ];

  List<String> nav = [
    "playlist",
    "colors",
    "numbers",
    "letters",
    "animals",
    "foods",
    "feelings",
    "questions",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dictionary"),
        backgroundColor: Color.fromRGBO(64, 72, 153, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen())),
        ),
      ),
      body: SafeArea(
        bottom: true,
        left: true,
        right: true,
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, nav[index]),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Color.fromRGBO(64, 72, 153, 1)
                              ]),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              images[index],
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              titles[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
