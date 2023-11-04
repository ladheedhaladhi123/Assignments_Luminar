///import 'package:assignment/signup.dart';
import 'package:flutter/material.dart';
import 'package:project_application1/assignments/login/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_application1/assignments/login/Signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HoMe(),
  ));
}

class HoMe extends StatefulWidget {


  @override
  State<HoMe> createState() => HoMeState();
}

class HoMeState extends State<HoMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, top: 100),
              child: Text(
                "Hello There!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "Automatic identity verification which enables you to verify your identity",
                style: TextStyle(fontSize: 10),
              ),
            ),
            Image.asset(
              "assets/images/lggh.jpg",
              height: 220,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    minimumSize: Size(250, 50),
                  ),
                  child: const Text("Login")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    minimumSize: Size(250, 50),
                  ),
                  child: Text("Sign Up")),
            ),
          ],
        ),
      ),
    );
  }
}