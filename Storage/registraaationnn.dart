import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_application1/assignments/login/Login.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  // List<Map<String, dynamic>> users=[];

  var formkey = GlobalKey<FormState>();
  bool passvisibility1 = true;
  bool passvisibility2 = true;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 100, right: 100, top: 100),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  "Create an Account, It's free",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon: const Icon(Icons.people),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))
                    ) ,
                    validator: (name) {
                      if (name!.isEmpty){
                        return "Fields are Empty or Invalid";
                      }else{
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email ID",
                        prefixIcon: const Icon(Icons.contact_mail_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                    validator: (username) {
                      if (username!.isEmpty || !username.contains("@")) {
                        return "Fields are empty or Invalid";
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscuringCharacter: "*",
                  obscureText: passvisibility1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.visibility_off_sharp),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passvisibility1 == true) {
                                passvisibility1 = false;
                              } else {
                                passvisibility1 = true;
                              }
                            });
                          },
                          icon: Icon(passvisibility1 == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                  validator: (pass) {
                    password = pass;

                    if (pass!.isEmpty || pass.length < 6) {
                      return "Fields are empty or Password length must be greaterthan 6";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     obscuringCharacter: "*",
              //     obscureText: passvisibility2,
              //     decoration: InputDecoration(
              //         prefixIcon: Icon(Icons.visibility_off_sharp),
              //         suffixIcon: IconButton(
              //             onPressed: () {
              //               setState(() {
              //                 if (passvisibility2 == true) {
              //                   passvisibility2 = false;
              //                 } else {
              //                   passvisibility2 = true;
              //                 }
              //               });
              //             },
              //             icon: Icon(passvisibility2 == true
              //                 ? Icons.visibility_off_sharp
              //                 : Icons.visibility)),
              //         hintText: "Password",
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(50))),
              //     validator: (cpass) {
              //       if (cpass!.isEmpty || cpass != password) {
              //         return "Fields are empty or Password length must be greaterthan 6";
              //       } else {
              //         return null;
              //       }
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      final valid = formkey.currentState!.validate();
                      if (valid) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
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
                    child: const Text("Sign UP")),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text("Already have an account ? Login"))
            ],
          )),
    );
  }
}