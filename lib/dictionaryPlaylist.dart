// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:hand_speech/VideoScreen.dart';
// import 'package:hand_speech/home.dart';

// class DictionaryScreen extends StatefulWidget {
//   @override
//   _DictionaryScreenState createState() => _DictionaryScreenState();
// }

// class _DictionaryScreenState extends State<DictionaryScreen> {
//   final _controller = ScrollController();

//   var videoList = [
//     {
//       "name": "manual Alphapets",
//       "url": "https://vimeo.com/565665029",
//       "thumb_url": "assets/images/dictionary.png"
//     },
//     {
//       "name": "Gestures & body language",
//       "url": "https://mha.vids.io/videos/ea9ddcb21717e1c263/chocolate-mp4",
//       "thumb_url": "assets/images/dictionary.png"
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     Timer(
//       Duration(seconds: 1),
//       () => _controller.jumpTo(_controller.position.maxScrollExtent),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(64, 72, 153, 1),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomeScreen())),
//         ),
//       ),
//       body: SafeArea(
//         bottom: true,
//         left: true,
//         right: true,
//         top: true,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                   alignment: Alignment.topCenter,
//                   child: Image.asset("assets/images/dictionary.png",
//                       width: 300, height: 300)),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 250,
//                 child: ListView(
//                   children: videoList
//                       .map((e) => GestureDetector(
//                             onTap: () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => VideoScreen(
//                                         name: e["name"], url: e["url"]))),
//                             child: Image.asset(e["thumb_url"]),
//                           ))
//                       .toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
