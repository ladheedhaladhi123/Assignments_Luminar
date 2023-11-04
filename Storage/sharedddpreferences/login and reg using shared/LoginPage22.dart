import 'package:flutter/material.dart';
import 'package:project_application1/Storage/sharedddpreferences/login%20and%20reg%20using%20shared/shared%20registration.dart';
import 'package:project_application1/Storage/sharedddpreferences/simpleLoginUsingSharedPreference/shared-home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(home: LoginpagE(),));
}

class LoginpagE extends StatefulWidget {
  @override
  State<LoginpagE> createState() => _Login2State();
}

class _Login2State extends State<LoginpagE> {
  final uname = TextEditingController();
  final pass = TextEditingController();
  late SharedPreferences preferences;
  late bool newuser;

  @override
  void initState(){
    check_if_user_already_login();
    super.initState();
  }

  void check_if_user_already_login() async{
    preferences = await SharedPreferences.getInstance();
    newuser = preferences.getBool('newuser')?? true;
    if(newuser==false){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SharedHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoGIN2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: uname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),hintText: "UserName"),
            ),),
            Padding(padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: pass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),hintText: "password"),
            ),),
            ElevatedButton(onPressed: () => validateandLogin(), child: Text("Login")),
            ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationP()));},
                child: Text("Go to RegistrationPage"))
          ],
        ),
      ),
    );
  }

  void validateandLogin() async{
    preferences = await SharedPreferences.getInstance()!;
    String storedusername = preferences.getString('uname')!;
    String storedpassword = preferences.getString('pass')!;

    //values that we entered at text field
    String usname = uname.text;
    String pwd = pass.text;
    preferences.setBool(('newuser'), false);

    if(storedusername==usname && storedpassword==pwd) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SharedHome()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid username or password")));
    }
  }
}


