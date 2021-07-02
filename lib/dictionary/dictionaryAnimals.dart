import 'package:flutter/material.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';

class DictionaryAnimals extends StatefulWidget {
  @override
  _DictionaryAnimalsState createState() => _DictionaryAnimalsState();
}

class _DictionaryAnimalsState extends State<DictionaryAnimals> {
  List<String> animals = [
    "Cow",
    "horse",
    "sheep",
    "pig",
    "chicken",
    "duck",
    "frog",
    "goat",
    "mouse",
    "dog",
  ];

  List<String> aslAnimals = [
    "assets/images/dictionary/animals/cow.jpg",
    "assets/images/dictionary/animals/horse.jpg",
    "assets/images/dictionary/animals/sheep.jpg",
    "assets/images/dictionary/animals/pig.jpg",
    "assets/images/dictionary/animals/chicken.jpg",
    "assets/images/dictionary/animals/duck.jpg",
    "assets/images/dictionary/animals/frog.jpg",
    "assets/images/dictionary/animals/goat.gif",
    "assets/images/dictionary/animals/mouse.gif",
    "assets/images/dictionary/animals/dog.gif",
  ];

  List<String> description = [
    "Make the ASL sign for the letter Y (by making a fist and then extending your thumb and pinkie finger) and place your thumb to your temple.",
    "Make a fist and then extend your first two fingers and thumb, fingertips pointing up, and then place your thumb on your head above your ear and bend your fingers forward a couple of times.",
    "Extend a bent arm in front of you, use the first two fingers of your other hand to create “scissors,” and then move your “scissors” up and down the other arm. (This sign mimics shearing a sheep.)",
    "Make the ASL sign for B (holding all four fingers of one hand straight up, touching, while laying your thumb against your palm), place the top of your letter B hand under your chin, and bend your fingers down once or twice.",
    "Cup one hand in front of your body, palm facing up. Make a fist with the other hand and extend your index finger and thumb, place the back of your hand to your chin, then open and close your index finger and thumb. Move your extended fingers to the center of your other palm and tap your hand a few times. ",
    "Make a fist your hand and extend your index finger, middle finger, and thumb, then place the back of your hand to your chin, and open and close your fingers and thumb.",
    "Place a fist under your chin, and then move your first two fingers out and in several times, with your thumb catching the fingers on the in movement.",
    "To show the beard and horn of a goat, touch the right “S” hand to the chin. Then move it upward to just in front of the forehead, changing to a “V” hand.",
    "Gently brush the nose twice with a right “D” hand.",
    "Snap your fingers, hand at your side.",
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
                        aslAnimals[_selectedIndex],
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
                  itemCount: 10,
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
                              animals[index],
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
