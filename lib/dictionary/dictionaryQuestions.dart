import 'package:flutter/material.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';

class DictionaryQuestions extends StatefulWidget {
  @override
  _DictionaryQuestionsState createState() => _DictionaryQuestionsState();
}

class _DictionaryQuestionsState extends State<DictionaryQuestions> {
  List<String> quest = [
    "who?",
    "what?",
    "where?",
    "when?",
    "which?",
    "why?",
    "how?",
  ];

  List<String> aslquest = [
    "assets/images/dictionary/questions/who.jpg",
    "assets/images/dictionary/questions/what.jpg",
    "assets/images/dictionary/questions/where.jpg",
    "assets/images/dictionary/questions/when.jpg",
    "assets/images/dictionary/questions/which.jpg",
    "assets/images/dictionary/questions/why.jpg",
    "assets/images/dictionary/questions/how.jpg",
  ];

  List<String> description = [
    "With your dominatn hand, place your thumb on your chin and let your index finger wiggle from the joint. The other three fingers curl under.",
    "Put your hands outward in front of you, with elbows bent and palms up. Shake your hands back and forth towards each other.",
    "Hold up the index finger of your dominant hand, like you’re indicating “one,” then shake it side to side.",
    "Put both of your index fingers together at a 90-degree angle at the tips. Your dominant index finger then makes a full circle around the passive index finger and returns to the starting position.",
    "Make both hands into fists with your thumbs pointing up; alternate each fist in an up-and-down movement.",
    "Touch the side of your forehead with the fingers of your dominant hand, extend your thumb and pinky (in the Y sign) while you bring your hand down, middle three fingers in, to chest level.",
    "With fingers pointing downward and backs of fingers and knuckles touching, roll hands inward to your chest and up so that the pinky sides of your hands are touching.",
  ];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  var colorValue = Color.fromRGBO(64, 72, 153, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 2 / 3,
            color: Color.fromRGBO(64, 72, 153, 1),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DictionaryScreen()));
                        }),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                new Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                    ),
                    child: new Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Image.asset(
                        aslquest[_selectedIndex],
                        fit: BoxFit.fill,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description[_selectedIndex],
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 1 / 3,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                          onTap: () {
                            _onSelected(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? Color.fromRGBO(64, 72, 153, 1)
                                  : Colors.white,
                            )),
                            height: 20,
                            width: 20,
                            child: Center(
                                child: Text(
                              quest[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(64, 72, 153, 1),
                                  fontWeight: FontWeight.bold),
                            )),
                          )),
                    );
                  })),
        ],
      ),
    );
  }
}
