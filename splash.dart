import 'package:flutter/material.dart';


void main(){
  //runApp attach widget tree to the UI
  runApp(MaterialApp(
    home: MysplashPage(),));//initial root
}

class MysplashPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return  Scaffold(appBar: AppBar(title: Text("My splash Page"),),);
  }
}