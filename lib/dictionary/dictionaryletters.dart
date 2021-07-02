import 'package:flutter/material.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';

class DictionaryLetters extends StatefulWidget {
  @override
  _DictionaryLettersState createState() => _DictionaryLettersState();
}

class _DictionaryLettersState extends State<DictionaryLetters> {
  List<String> letters = [
    "assets/images/dictionary/letters/a.jpg",
    "assets/images/dictionary/letters/b.jpg",
    "assets/images/dictionary/letters/c.jpg",
    "assets/images/dictionary/letters/d.jpg",
    "assets/images/dictionary/letters/e.jpg",
    "assets/images/dictionary/letters/f.jpg",
    "assets/images/dictionary/letters/g.jpg",
    "assets/images/dictionary/letters/h.jpg",
    "assets/images/dictionary/letters/i.jpg",
    "assets/images/dictionary/letters/j.jpg",
    "assets/images/dictionary/letters/k.jpg",
    "assets/images/dictionary/letters/l.jpg",
    "assets/images/dictionary/letters/m.jpg",
    "assets/images/dictionary/letters/n.jpg",
    "assets/images/dictionary/letters/o.jpg",
    "assets/images/dictionary/letters/p.jpg",
    "assets/images/dictionary/letters/q.jpg",
    "assets/images/dictionary/letters/r.jpg",
    "assets/images/dictionary/letters/s.jpg",
    "assets/images/dictionary/letters/t.jpg",
    "assets/images/dictionary/letters/u.jpg",
    "assets/images/dictionary/letters/v.jpg",
    "assets/images/dictionary/letters/w.jpg",
    "assets/images/dictionary/letters/x.jpg",
    "assets/images/dictionary/letters/y.jpg",
    "assets/images/dictionary/letters/z.jpg",
  ];

  List<String> aslLetters = [
    "assets/images/dictionary/letters/a.gif",
    "assets/images/dictionary/letters/b.gif",
    "assets/images/dictionary/letters/casl.jpg",
    "assets/images/dictionary/letters/d.gif",
    "assets/images/dictionary/letters/e.gif",
    "assets/images/dictionary/letters/f.gif",
    "assets/images/dictionary/letters/g.gif",
    "assets/images/dictionary/letters/h.gif",
    "assets/images/dictionary/letters/i.gif",
    "assets/images/dictionary/letters/j.gif",
    "assets/images/dictionary/letters/kasl.png",
    "assets/images/dictionary/letters/l.gif",
    "assets/images/dictionary/letters/m.gif",
    "assets/images/dictionary/letters/n.gif",
    "assets/images/dictionary/letters/o.gif",
    "assets/images/dictionary/letters/p.gif",
    "assets/images/dictionary/letters/q.gif",
    "assets/images/dictionary/letters/r.gif",
    "assets/images/dictionary/letters/s.gif",
    "assets/images/dictionary/letters/t.gif",
    "assets/images/dictionary/letters/u.gif",
    "assets/images/dictionary/letters/v.gif",
    "assets/images/dictionary/letters/w.gif",
    "assets/images/dictionary/letters/x.gif",
    "assets/images/dictionary/letters/y.gif",
    "assets/images/dictionary/letters/z.gif",
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
                  height: 150,
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
                        aslLetters[_selectedIndex],
                        fit: BoxFit.fill,
                      ),
                    )),
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
                  itemCount: 26,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
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
                            child: Image.asset(letters[index]),
                          )),
                    );
                  })),
        ],
      ),
    );
  }
}
