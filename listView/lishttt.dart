import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: Listview1(),
  ));
}

class Listview1 extends StatelessWidget {
  const Listview1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView(
        children: [
          Center(
              child: Text("Select what you want!!!",
                style: GoogleFonts.bebasNeue(fontSize: 30,color: Colors.indigo),)),

          const Card(
            child: ListTile(
              title: Text("Unknown"),
              subtitle: Text("Hacker"),
              trailing: Icon(Icons.shopping_cart),
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/pxfuel.jpg")),
            ),
          ),


            const Card(
              child: ListTile(
                title: Text("Anfield"),
                subtitle: Text("Stadium"),
                trailing: Icon(Icons.shopping_cart),
                leading: CircleAvatar(backgroundImage: AssetImage("assets/images/stadium.jpg")),
              ),
            ),




        ],
      ),
    );
  }
}
