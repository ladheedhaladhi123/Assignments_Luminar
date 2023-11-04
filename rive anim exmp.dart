import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main(){
  runApp(MaterialApp(home: riveAnimEx(),));
}

class riveAnimEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: SizedBox(
           width: double.infinity,
              height:double.infinity ,
             child:RiveAnimation.asset("assets/animation/global.riv",) ,


    ),
    );
  }
}
