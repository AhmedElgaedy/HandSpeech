// import 'package:flutter/material.dart';
// import 'package:hand_speech/dictionaryPlaylist.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoScreen extends StatefulWidget {
//   final String name, url;

//   const VideoScreen({Key key, this.name, this.url}) : super(key: key);
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   YoutubePlayerController _controller;
//   bool _isPlayerReady = false;
//   var _playerState;
//   @override
//   void initState() {
//     super.initState();
//     this._controller = YoutubePlayerController(
//       initialVideoId: 'lgkZC_Ss6YE',
//       flags: YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: true,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(_videoPlayerListner);
//   }

//   void _videoPlayerListner() {
//     if (_isPlayerReady) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//       });
//     }
//   }

//   @override
//   void deactivate() {
//     _controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Color.fromRGBO(64, 72, 153, 1),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => DictionaryScreen())),
//           ),
//         ),
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 8,
//             ),
//             YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: Colors.blueAccent,
//               topActions: <Widget>[
//                 SizedBox(width: 8.0),
//                 Expanded(
//                   child: Text(
//                     _controller.metadata.title,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                 ),
//               ],
//               onReady: () {
//                 _isPlayerReady = true;
//               },
//               onEnded: (data) {},
//             ),
//           ],
//         ));
//   }
// }
