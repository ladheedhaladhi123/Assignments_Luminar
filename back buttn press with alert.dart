import 'package:flutter/material.dart';

class ExitAppAlert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future<bool>showAlert()async{
      return await showDialog(context: context, builder: (context){
        return  AlertDialog(
          title: Text("ext"),
          content: Text("Do You really Want to exit"),
          actions: [
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
               }, child: const Text("Yes")),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                }, child: const Text("No")),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                }, child: const Text("Cancel")),
          ],
        );
      });

    }
    return WillPopScope(onWillPop: showAlert,child: Scaffold(
      appBar: AppBar(
        title: const Text("EXIT FROM APP"),
      ),
      body: const Center(
        child: Text("Press BAck Button to Exit !!!"),
      ),
    ));
  }
}
void main(){
  runApp(MaterialApp(home: ExitAppAlert(),));
}