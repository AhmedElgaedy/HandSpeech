import 'package:flutter/material.dart';
import 'package:hand_speech/dictionaryScreen.dart';

class DictionaryFoods extends StatefulWidget {
  @override
  _DictionaryFoodsState createState() => _DictionaryFoodsState();
}

class _DictionaryFoodsState extends State<DictionaryFoods> {
  List<String> foods = [
    "Food",
    "breakfast",
    "lunch",
    "dinner",
    "need ice",
    "water-warm",
    "coffee-strong",
  ];

  List<String> aslfoods = [
    "assets/images/dictionary/foods/food.jpg",
    "assets/images/dictionary/foods/breakfast.jpg",
    "assets/images/dictionary/foods/lunch.jpg",
    "assets/images/dictionary/foods/dinner.jpg",
    "assets/images/dictionary/foods/needice.jpg",
    "assets/images/dictionary/foods/waterwarm.jpg",
    "assets/images/dictionary/foods/coffeestrong.jpg",
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
                        aslfoods[_selectedIndex],
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
                              foods[index],
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
