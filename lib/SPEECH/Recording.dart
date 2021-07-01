import 'package:flutter/material.dart';
import 'package:microphone/microphone.dart';




class Recodingclass extends StatefulWidget {
  const Recodingclass({Key key}) : super(key: key);

  @override
  _RecodingclassState createState() => _RecodingclassState();
}

class _RecodingclassState extends State<Recodingclass> {
  @override
  Widget build(BuildContext context) {
    MicrophoneRecorder _recorder;

    void initState() {
      super.initState();

    }

    @override


    void initRecorder() {
      // Dispose the previous recorder.
      _recorder?.dispose();

      _recorder = MicrophoneRecorder()
        ..init()
        ..addListener(() {
          setState(() {});
        });
    }

    @override
    Widget build(BuildContext context) {
      final value = _recorder.value;
      Widget result;

      if (value.started) {
        if (value.stopped) {
          result = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(initRecorder);
                },
                child: Text('Restart recorder'),
              ),

            ],
          );
        } else {
          result = OutlinedButton(
            onPressed: () {
              _recorder.stop();
            },
            child: Text('Stop recording'),
          );
        }
      } else {
        result = OutlinedButton(
          onPressed: () {
            _recorder.start();
          },
          child: Text('Start recording'),
        );

      }

      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: result,
          ),
        ),
      );
    }
  }
}