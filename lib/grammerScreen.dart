import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hand_speech/home.dart';

class GrammerScreen extends StatefulWidget {
  @override
  GrammerScreenState createState() => new GrammerScreenState();
}

class GrammerScreenState extends State<GrammerScreen> {
  SwiperController _swiperController;
  double prevOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> swiperItemsList = [
      buildSwiperItem(
          "assets/images/grammar1.PNG",
          "In a simple topic/comment sentence, the topic is described first, followed by the comment.\n \n Example: HER MONEY LOST, SHE UPSET \n English: She's upset that she lost her money",
          firstGradient,
          "Topic/Comment"),
      buildSwiperItem(
          "assets/images/grammar2.PNG",
          "The time sign is placed at the beginning or near the beginning of a sentences.\n\n Example: YESTERDAY, ME STAY HOME \n English: I stayed home yesterday. \n The time sign was 'yesterday' and was located near the beginning of the sentence. ",
          secondtGradient,
          "Tense with Time"),
      buildSwiperItem(
          "assets/images/grammar3.PNG",
          "Short sentences that ask a yes/no question. The order of the signs varies \n\n Example: EXERCISE YOU WANT YOU? with eyebrows raised \n English: Do you want to exercise? ",
          thirdGradient,
          "Simple Yes/No"),
      buildSwiperItem(
          "assets/images/grammar3.PNG",
          "Long yes/no questions, sometimes they use a topic/comment format.\n\n Example: CAT BLACK TREE CLIMB, YOUR? with eyebrows raised \n English: Is that black cat climbing the tree yours? ",
          firstGradient,
          "Long Yes/No"),
      buildSwiperItem(
          "assets/images/grammar5.PNG",
          "Simple questions that ask for information. They can have variable sentence structures, and rely sometimes on non-manual signals to distinguish them from a declarative sentence.\n\n Example: OLD++ YOU? with eyebrows squeezed\n English: How old are you?",
          secondtGradient,
          "Information Seeking"),
      buildSwiperItem(
          "assets/images/grammar6.PNG",
          "Pronouns are indicated by pointing to either a person or thing that is present \n\n Example: MY BROTHER VISIT-ME \n English: My brother is visiting me.",
          thirdGradient,
          "Pronominalization"),
      buildSwiperItem(
          "assets/images/grammar7.PNG",
          "In a rhetorical question, the signer asks a question and then answers it. \n\n Example: GAME ME PLAY \n English: I'm playing a game",
          firstGradient,
          "Rhetorical"),
      buildSwiperItem(
          "assets/images/grammar8.PNG",
          "The condition is described first, then the outcome of the condition is described. \n\n Example: SUPPOSE SHE SEE ME, ME HAVE-TO LEAVE \n English: I will have to leave if she sees me.",
          secondtGradient,
          "Conditional"),
      buildSwiperItem(
          "assets/images/grammar9.PNG",
          "You can negate a thought by placing a negative sign before the verb. \n\n Example: ME NOT WATCH FOOTBALL GAME. \n English: I'm not watching the football game.",
          thirdGradient,
          "Negation"),
    ];
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 72, 153, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        title: Text('ASL grammar'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 6,
              child: Swiper(
                controller: _swiperController,
                itemCount: swiperItemsList.length,
                onIndexChanged: (int value) {
                  if (value == 2) {
                    setState(() {
                      prevOpacity = 0.0;
                    });
                  } else {
                    setState(() {
                      prevOpacity = 1.0;
                    });
                  }
                },
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height / 1.5,
                itemBuilder: (BuildContext context, index) {
                  return swiperItemsList[index];
                },
                layout: SwiperLayout.TINDER,
                curve: Curves.bounceOut,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                print("prev");
                _swiperController.previous(animation: true);
                print(_swiperController.index.toString());
                setState(() {
                  prevOpacity = 0.0;
                });
              },
              child: Opacity(
                opacity: prevOpacity,
                child: Text(
                  "PREV",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("next");
                _swiperController.next(animation: true);
                print(_swiperController.index);
              },
              child: Text(
                "NEXT",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 72, 153, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwiperItem(
      String image, String text, Gradient gradient, String endText) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(0.8),
              blurRadius: 4,
            ),
          ],
          gradient: gradient),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                text,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.3,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              endText,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

const firstGradient = LinearGradient(
  colors: [
    Color(0xFF4358e6),
    Color(0xFF8f9eff),
  ],
);

const secondtGradient = LinearGradient(
  colors: [
    Color(0xFF387be0),
    Color(0xFF82b4ff),
  ],
);

const thirdGradient = LinearGradient(
  colors: [
    Color(0xFF317ebd),
    Color(0xFF71b4eb),
  ],
);
