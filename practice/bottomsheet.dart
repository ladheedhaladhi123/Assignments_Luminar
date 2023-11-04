import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){

  runApp(
      MaterialApp(
        home:Bottomsheet(),));
}

class Bottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottomsheet with image on tap"),),
      body: Center(
        child: GestureDetector(

            onDoubleTap  : () => showsheet(context),
            child: Image.asset("assets/images/dreamy.jpg")),
      ),
    );
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: Text("Whatsapp"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  title: Text("Facebook"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.message,
                    color: Colors.black,
                  ),
                  title: Text("Messages"),
                ),
              ],

            ),
          );
        });
  }
}