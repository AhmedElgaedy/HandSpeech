import 'package:flutter/material.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';

class DictionaryColors extends StatefulWidget {
  @override
  _DictionaryColorsState createState() => _DictionaryColorsState();
}

class _DictionaryColorsState extends State<DictionaryColors> {
  List<String> colors = [
    "assets/images/dictionary/colors/black.png",
    "assets/images/dictionary/colors/white.png",
    "assets/images/dictionary/colors/grey.png",
    "assets/images/dictionary/colors/blue.png",
    "assets/images/dictionary/colors/red.png",
    "assets/images/dictionary/colors/brown.png",
    "assets/images/dictionary/colors/green.png",
    "assets/images/dictionary/colors/yellow.png",
    "assets/images/dictionary/colors/orange.png",
    "assets/images/dictionary/colors/pink.png",
    "assets/images/dictionary/colors/purple.png",
  ];

  List<String> aslColors = [
    "assets/images/dictionary/colors/blackasl.PNG",
    "assets/images/dictionary/colors/whiteasl.PNG",
    "assets/images/dictionary/colors/greyasl.PNG",
    "assets/images/dictionary/colors/blueasl.PNG",
    "assets/images/dictionary/colors/redasl.PNG",
    "assets/images/dictionary/colors/brownasl.PNG",
    "assets/images/dictionary/colors/greenasl.PNG",
    "assets/images/dictionary/colors/yellowasl.PNG",
    "assets/images/dictionary/colors/orangeasl.PNG",
    "assets/images/dictionary/colors/pinkasl.PNG",
    "assets/images/dictionary/colors/purpleasl.PNG",
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
                        aslColors[_selectedIndex],
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
                  itemCount: 11,
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
                            child: Image.asset(colors[index]),
                          )),
                    );
                  })),
        ],
      ),
    );
  }
}
