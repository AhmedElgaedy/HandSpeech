import 'package:flutter/material.dart';
import 'package:hand_speech/dictionary/chewieListtem.dart';
import 'package:hand_speech/dictionary/dictionaryScreen.dart';
import 'package:video_player/video_player.dart';

class DictionaryPlaylist extends StatefulWidget {
  @override
  _DictionaryPlaylistState createState() => _DictionaryPlaylistState();
}

class _DictionaryPlaylistState extends State<DictionaryPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("ASL Playlist"),
        backgroundColor: Color.fromRGBO(64, 72, 153, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => DictionaryScreen())),
        ),
      ),
      body: ListView(
        cacheExtent: 50.0,
        children: <Widget>[
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videoes/ASLlesson1.mp4',
          //   ),
          //   looping: true,
          // ),
          Center(
              child: Text("Lesson 1 : Gestures & body language",
                  style: TextStyle(
                      color: Color.fromRGBO(64, 72, 153, 1),
                      fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          Divider(
            color: Color.fromRGBO(64, 72, 153, 1),
            thickness: 3.0,
          ),
          SizedBox(height: 10),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videoes/ASLlesson2.mp4',
          //   ),
          //   looping: true,
          // ),
          Center(
            child: Text("Lesson 2 : ABCs , colors & pronouns",
                style: TextStyle(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Divider(
            color: Color.fromRGBO(64, 72, 153, 1),
            thickness: 3.0,
          ),
          SizedBox(height: 10),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videoes/ASLlesson3.mp4',
          //   ),
          //   looping: true,
          // ),
          Center(
            child: Text("Lesson 3 : Everyday Signs & Common Phrases",
                style: TextStyle(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Divider(
            color: Color.fromRGBO(64, 72, 153, 1),
            thickness: 3.0,
          ),
          SizedBox(height: 10),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videoes/ASLlesson4.mp4',
          //   ),
          //   looping: true,
          // ),
          Center(
            child: Text("Lesson 4 : Time & Calendar",
                style: TextStyle(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Divider(
            color: Color.fromRGBO(64, 72, 153, 1),
            thickness: 3.0,
          ),
          SizedBox(height: 10),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videoes/ASLlesson5.mp4',
          //   ),
          //   looping: true,
          // ),
          Center(
            child: Text("Lesson 5 : Food & Drinks",
                style: TextStyle(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Divider(
            color: Color.fromRGBO(64, 72, 153, 1),
            thickness: 3.0,
          ),
          SizedBox(height: 10),
          // ChewieListItem(
          //   videoPlayerController: VideoPlayerController.asset(
          //     'assets/videoes/ASLlesson6.mp4',
          //   ),
          //   looping: true,
          // ),
          Center(
            child: Text("Lesson 6 : Animals & Sports",
                style: TextStyle(
                    color: Color.fromRGBO(64, 72, 153, 1),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
