import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_application1/Storage/hive_using_adapters/database/hiveDB.dart';
import 'package:project_application1/Storage/hive_using_adapters/models/user_model.dart';
import 'package:project_application1/Storage/hive_using_adapters/screens/home.dart';
import 'package:project_application1/Storage/hive_using_adapters/screens/register.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Hive.registerAdapter();
  await Hive.openBox<User>('userdata');
  runApp(GetMaterialApp(home: Login(),));
}

class Login extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HiveLogin"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: email,
            decoration: const InputDecoration(
              hintText: 'UserName',
              border: OutlineInputBorder()),
          ),),
          Padding(padding: const EdgeInsets.all(10),
            child: TextField(
              controller: pass,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () async{
            final users = await HiveDb.instance.getUser();
            checkUserExist(context,users);
          },
              child: const Text("Login")),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterHive()));},
              child: const Text("Not a User? Register Here! ")),
        ],
      ),

    );
  }

  Future<void> checkUserExist(BuildContext context,List<User> users) async{
    final lemail = email.text.trim();
    final lpass = pass.text.trim();
    bool userFound = false;
    if(lemail != "" && lpass != ""){
      await Future.forEach(users, (singleUser){
        if(lemail == singleUser.email && lpass == singleUser.password){
          userFound = true;
        }else{
          userFound = false;
        }
      });
      if(userFound==true){
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context)=>HiveHome()));
        Get.offAll(HiveHome(email: lemail,));
      }else{
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Login Failed,User Not Found")));
        Get.snackbar('FAILED', 'User Not Exist!');
      }
    }else{
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Field Must Not be Empty")));
      Get.snackbar('ERROR', 'Fields Must not be Empty');
    }
  }
}

