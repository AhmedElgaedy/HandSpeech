import 'package:flutter/material.dart';
import 'package:hand_speech/dictionaryScreen.dart';

class DictionaryFeelings extends StatefulWidget {
  @override
  _DictionaryFeelingsState createState() => _DictionaryFeelingsState();
}

class _DictionaryFeelingsState extends State<DictionaryFeelings> {
  List<String> feelings = [
    "angry",
    "happy",
    "sad",
    "scared",
    "safe",
    "sorry",
  ];

  List<String> aslfeelings = [
    "assets/images/dictionary/feelings/angry.jpg",
    "assets/images/dictionary/feelings/happy.jpg",
    "assets/images/dictionary/feelings/sad.jpg",
    "assets/images/dictionary/feelings/scared.jpg",
    "assets/images/dictionary/feelings/safe.jpg",
    "assets/images/dictionary/feelings/sorry.jpg",
  ];

  List<String> description = [
    "Make the open-5 hand shape, palm toward your face, and pull your hand away from your face, scrunching up your fingers.",
    "Place your palms at upper-chest level, hands open and facing your torso, and make little circles with your hands or pat your chest.",
    "Using both hands, place your spread-out fingers at your face, palms toward your head so that you’re peeking out between your fingers. Then, making a drooping face, draw your hands down to approximately shoulder level.",
    "Make loose fists with both hands; place one at shoulder level, the other just above hip level. While making a scared face, move your hands into the open-5 hand shape, wrists crossing each other quickly in front of your body as if you’re protecting your body from something scary.",
    "Cross your arms at your wrists, hands in S shapes, palms facing but not touching your body. Pull your hands apart while twisting palms to face away from your body, stopping at the shoulder area. Keep those S shapes.",
    "Make a sad, apologetic face. With a hand in the ASL letter S shape, place your fist, palm facing your body, over your heart and make a circle.",
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
                        aslfeelings[_selectedIndex],
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
                  itemCount: 6,
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
                              feelings[index],
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
