import 'package:flutter/material.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';

class DictionaryNumbers extends StatefulWidget {
  @override
  _DictionaryNumbersState createState() => _DictionaryNumbersState();
}

class _DictionaryNumbersState extends State<DictionaryNumbers> {
  List<String> numbers = [
    "1 - 5",
    "6 - 9",
    "10",
    "11 - 15",
    "16 - 19",
    "20",
    "21",
    "22",
    "23 / 25",
    "24 /     26 - 29",
    "30 /     40 / 50",
    "35",
    "100",
  ];

  List<String> aslnumbers = [
    "assets/images/dictionary/numbers/1-5.jpg",
    "assets/images/dictionary/numbers/6-9.jpg",
    "assets/images/dictionary/numbers/10.jpg",
    "assets/images/dictionary/numbers/11-15.jpg",
    "assets/images/dictionary/numbers/16-19.jpg",
    "assets/images/dictionary/numbers/20.jpg",
    "assets/images/dictionary/numbers/21.jpg",
    "assets/images/dictionary/numbers/22.jpg",
    "assets/images/dictionary/numbers/2325.jpg",
    "assets/images/dictionary/numbers/24-29.jpg",
    "assets/images/dictionary/numbers/304050.jpg",
    "assets/images/dictionary/numbers/35.jpg",
    "assets/images/dictionary/numbers/100.jpg",
  ];

  List<String> description = [
    "The numbers 1-5 are just like counting on your fingers. The trick is to remember the order. It goes index finger (1), index and middle (2), index, middle, and thumb (3), all but thumb (4), and all five fingers (5). Normally, you should orient your hand palm back (palm facing you) for these numbers. ",
    "The numbers 6-9 are counted off by touching a finger to your thumb. Your palm is oriented out (towards the person to whom you are signing). The order is pinkie to thumb (6), then ring finger (7), middle finger (8), index (9). If you forget which way this goes, it might be helpful to remember that for the smallest number (6) you touch your thumb to the smallest finger (pinkie).",
    "The number 10 is signed by shaking an A hand thumb up (fingers bent in, thumb against the side of the index finger).",
    "The numbers 11-12 require flicking your fingers up two times, palm back. So for 11, flick your index finger up, for 12 your index and middle pressed together. For 13, it's more of a come here gesture with the thumb out and two fingers pressed together again. Same for 14 and 15 .",
    "For 16-19, you twist the base number twice, starting palm back. You twist the wrist as if you were going to turn the sign all the way to face palm out, but it doesn't go all the way, only about 1/2 (so if you're right handed it goes from palm back to palm left twice). 16 is the 6 sign twisted twice, 17 the 7 sign, etc.",
    "For 20, tap your thumb and index finger together twice, fingertips facing forward, other fingers bent at the knuckle with their tips touching the base of your palm (like pinching something). This looks like the sign for G opening and closing.",
    "The sign for 21 almost looks like a gun--palm back, index finger pointing to the side, thumb pinches down twice against the index finger.",
    " The sign for 22 is a 2 with the palm facing down, followed by another two signed a few inches away (towards the right if you're right-handed). The same idea is used for 33, 44, etc.",
    "The signs for 23 and 25 are similar--palm oriented forward, start from a 3 handshape and flick the middle finger down twice (23) or start from a 5 shape and flick middle finger down twice (25).",
    " The signs for 24 and 26-29 are all palm forward, sign that gun shape with the index finger pointing forward and thumb up, then sign the 4, 6, 7, 8, or 9 after it.",
    "The signs for 30, 40, 50 etc are simply 3-0 (hand in an o shape), 4-0, etc.All the numbers in between are formed the same way, palm forward, as digits (4-7, 8-2, etc.) with the exception of double numbers like 33",
    "There is one other exception--35 can be signed like 25 except you flick your ring finger down instead of the middle. This is optional, though. 3-5 is also perfectly acceptable.",
    "Remember that your palm faces out except for the double numbers (33, 44, 55, 66, 77, 88, 99) which are signed with the palm down. 30-99 are signed as single digits, so 32 will be signed 3-2, 41 will be 4-1, etc.",
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
                        aslnumbers[_selectedIndex],
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
                  itemCount: 13,
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
                              numbers[index],
                              style: TextStyle(
                                  fontSize: 25,
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
