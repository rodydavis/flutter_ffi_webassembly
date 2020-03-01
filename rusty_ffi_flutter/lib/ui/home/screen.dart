import 'package:flutter/material.dart';
// import 'package:rusty_ffi_flutter/src/hello_world.dart';
// import 'package:rusty_ffi_flutter/src/play_audio.dart';
import 'dart:js' as js;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          // playAudio("assets/sounds/beep2.wav");
          // helloWorld();
          js.context.callMethod('addNum', [2, 4]);
        },
      ),
    );
  }
}
