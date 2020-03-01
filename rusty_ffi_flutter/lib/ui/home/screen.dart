import 'package:flutter/material.dart';
import 'package:rusty_ffi_flutter/src/play_audio.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () => playAudio(),
      ),
    );
  }
}
