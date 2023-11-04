import 'package:flutter/material.dart';
import 'package:project_application1/assignments/login/Signup.dart';
import 'package:project_application1/home.dart';


///import 'package:flutter_application_1/assingment/signup1.dart';

import 'package:fluttertoast/fluttertoast.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  bool passwordvisibility = true;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, top: 100),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "Welcome back! Login with your credentials",
                style: TextStyle(fontSize: 10),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.contact_mail_outlined),
                    hintText: "Email ID"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: TextField(
                controller: passcontroller,
                obscureText: passwordvisibility,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (passwordvisibility == true) {
                              passwordvisibility = false;
                            } else {
                              passwordvisibility = true;
                            }
                          });
                        },
                        icon: Icon(passwordvisibility == true
                            ? Icons.visibility_off_sharp
                            : Icons.visibility)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.visibility_off_sharp),
                    hintText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    if (email == emailcontroller.text &&
                        password == passcontroller.text) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));

                      emailcontroller.text = "";
                      passcontroller.text = "";
                    } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid username or password"),
                      //   backgroundColor: Colors.blue,));
                      // }

                      Fluttertoast.showToast(
                          msg: "Invalid Username or Password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    minimumSize: Size(350, 50),
                  ),
                  child: const Text("Login")),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 200),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text("New User ? Sign Up")),
            )
          ],
        ),
      ),
    );
  }
}