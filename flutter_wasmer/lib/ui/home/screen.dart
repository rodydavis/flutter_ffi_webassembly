import 'package:flutter/material.dart';

import 'load_wasm.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        tooltip: "Load Wasm",
        onPressed: () => runWasm(),
      ),
    );
  }
}
