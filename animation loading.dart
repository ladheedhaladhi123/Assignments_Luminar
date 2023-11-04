import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(AnimatedLoader());
}

class AnimatedLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoaderScreen(),
    );
  }
}

class MyLoaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
            size: 90, color: Colors.indigo),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}