import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hand_speech/startup/LogInScreen.dart';
import 'package:hand_speech/startup/SignupScreen.dart';

class FirstLoginPage extends StatefulWidget {
  @override
  _FirstLoginPageState createState() => new _FirstLoginPageState();
}

class _FirstLoginPageState extends State<FirstLoginPage> {
  List<String> images = [
    "assets/images/welcome.png",
    "assets/images/translation.png",
    "assets/images/simple.png",
  ];

  List<String> maintext = [
    "Welcome to our application!",
    "Here we provide",
    "So , Let us communicate better!",
  ];

  List<String> subtext = [
    "A place where you are always heard",
    "Accessible,Affordable,\nASL translating services",
    "with a simple , friendly interface",
  ];
  Widget pageView() {
    return Swiper(
      containerHeight: 300,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                  height: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  maintext[index],
                  style: TextStyle(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  subtext[index],
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(64, 72, 153, 1),
                      fontFamily: 'Montserrat',
                      fontSize: 14),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 3,
      loop: true,
      autoplay: true,
      pagination: SwiperPagination(
        builder: SwiperPagination.dots,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 72, 153, 1),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomBackClip(),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: pageView(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Card(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "HandSpeech",
                                      style: TextStyle(
                                        color: Color.fromRGBO(64, 72, 153, 1),
                                        fontSize: 36,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Sign Up. Join our family!",
                                      style: TextStyle(
                                        color: Color.fromRGBO(64, 72, 153, 1),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "It will take less than a minute",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(64, 72, 153, 1),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LogInScreen(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                ),
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(64, 72, 153, 1),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBackClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
