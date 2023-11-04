import 'package:flutter/material.dart';
import 'package:project_application1/Storage/sharedddpreferences/login%20and%20reg%20using%20shared/LoginPage22.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationP extends StatefulWidget {
  const RegistrationP({super.key});

  @override
  State<RegistrationP> createState() => _RegistrationPState();
}

class _RegistrationPState extends State<RegistrationP> {
  final name = TextEditingController();
  final uname = TextEditingController();
  final pwd = TextEditingController();
  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRATION"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),hintText: "Name"),
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: uname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),hintText: "UserName"
                ),
              ),),
              Padding(padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: pwd,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),hintText: "Password"),
              ),),
              ElevatedButton(onPressed: () => storedata(), child: Text("Register Here"))
            ],
        ),
      ) ,
    );

  }

 void storedata() async{
    String personname = name.text;
    String username = uname.text;
    String password = pwd.text;

    preferences = await SharedPreferences.getInstance();
    preferences.setString('name', personname);
    preferences.setString('uname', username);
    preferences.setString('pwd', password);

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginpagE()));
 }
}

